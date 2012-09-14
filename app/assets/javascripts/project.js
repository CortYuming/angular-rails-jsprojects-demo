angular.module('project', ['sqlServices']).
  config(function($routeProvider, $httpProvider) {
    $routeProvider.
      when('/',
           {controller: ListCtrl, templateUrl: '/assets/list.html'}).
      when('/:projectId/edit',
           {controller: EditCtrl, templateUrl: '/assets/detail.html'}).
      when('/new',
           {controller: CreateCtrl, templateUrl: '/assets/detail.html'}).
      otherwise({redirectTo: '/'});
    $httpProvider.defaults.headers.
      common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content');
  });


function ListCtrl($scope, Project) {
  $scope.projects = Project.query();
}


function CreateCtrl($scope, $location, Project) {
  $scope.save = function() {
    Project.save($scope.project, function(project) {
      $location.path('/');
    });
  };
}


function EditCtrl($scope, $location, $routeParams, Project) {
  var self = this;

  Project.get({id: $routeParams.projectId}, function(project) {
    self.original = project;
    $scope.project = new Project(self.original);
  });

  $scope.isClean = function() {
    return angular.equals(self.original, $scope.project);
  };

  $scope.destroy = function() {
    self.original.destroy(function() {
      $location.path('/');
    });

  };

  $scope.save = function() {
    $scope.project.update(function() {
      $location.path('/');
    });
  };

}
