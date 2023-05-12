// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; // define version of solidity

//next is contract. this tells the solidty that our next piece of code is contrat.simpleStorage is the name of contract and everthing in curly braces is the content of this contract.
contract SimpleStorage {
     uint256 favoriteNumber;

    struct People {
        uint256 favoriteNumber;
        string name;
    }
    // uint256[] public anArray;
    People[] public people;

    mapping(string => uint256) public nameToFavoriteNumber;
 
     //so here virtual keyword is write so our function is know overrideable
    function store(uint256 _favoriteNumber) public virtual {
        favoriteNumber = _favoriteNumber;
    }
    
    function retrieve() public view returns (uint256){
        return favoriteNumber;
    }

    function addPerson(string memory _name, uint256 _favoriteNumber) public {
        people.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }
 


    //Basic types of solidity
    //bool favouriteNumber = true;
    //uint256 favouriteDigit = 5;
    //string favouriteNumberInText = "Five";
    //int256 favouriteItem = -5;
    //address myAddress = 0xCf05a09F3D05f46cE68e16C102666938666d3845;
    //bytes32 favouriteBytes = "cat";

    
    //this is initialized to default value 0
//     uint256 public  favouriteNumber;
//     uint256 public firstName;  


//      save the list of person  but there is the better way to store the list is array
//     People public person = People({favouriteDigit : 45 , name: "Rameela"});
//     People public person1 = People({favouriteDigit : 46 , name: "Malaika"});
//     People public person2 = People({favouriteDigit : 47 , name: "Khadija"});

//     if we want to store bunch of variables and values then we use arrays and struct and many more other types
//     struct People {
//         uint256 favouriteDigit;
//         string name;
//     } 

//     People[] public people;

//     struct Cricket {
//         uint256 favouriteGameNumber;
//         string favouritePlayer;
//         string favouriteGameName;
//     }

//     Cricket[] public cricket;  

    

//     struct Car {
//         uint256 carNumber;
//         string carName;
//         string carColor;
//         uint256 engineNumber;
//     }

//     Car[] public car;
//      mapping (string => uint256) public carNameToengineNumber ;

//     function store(uint256 _favouriteNumber) public{
//         favouriteNumber = _favouriteNumber;

//         like if we use here view function then it also spend some gas
//         retrive();
//     }

//     pure and view function do not consume gas but when when these function is used by gas using function then it may also spend gas
//      but here it is not spend gas  
//     these function disallow the updating and modification in blockchain
//      function retrive() public view returns(uint256){
//             return favouriteNumber;
//      }


//      function myinformation(uint256 _firstName) public{
//             firstName = _firstName;
//      }

//      function add() public view returns(uint256){
//          return firstName + 1;
//      }

//      function subtract() public view returns(uint256){
//          return firstName - 1;
//      }
     
//       function multiply() public view returns(uint256){
//           return firstName * 2;
//       } 
    
//      function division() public view returns(uint256){
//          return firstName / 2;
//      }

//    function addPlayer(uint256 _favouriteGameNumber, string memory _favouritePlayer, string memory _favouriteGameName) public{
//         Cricket memory addGameName = Cricket({
//             favouriteGameName: _favouriteGameName, 
//             favouritePlayer: _favouritePlayer, 
//            favouriteGameNumber: _favouriteGameNumber
//             });
//         cricket.push(addGameName);
//    }



//     function addPerson(string memory _name, uint256 _favouriteDigit) public {
//         People memory newPerson = People({
//             favouriteDigit: _favouriteDigit,
//             name: _name
//         });
//          people.push(newPerson);
//     }

//     function addCar(uint256 _carNumber, string memory _carName, string memory _carColor, uint256 _engineNumber) public {
        
//         Car memory carProperties = Car({
//             carNumber : _carNumber,
//             carName : _carName,
//             carColor : _carColor,
//             engineNumber : _engineNumber
//         });
//         car.push(carProperties);
//         carNameToengineNumber [_carName] = _engineNumber;
//     }
}