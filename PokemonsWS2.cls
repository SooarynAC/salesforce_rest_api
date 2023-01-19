@RestResource(urlMapping='/pokemons')
global with sharing class PokemonsWS {
  @HttpGet
  global static List<Pokemon_do_Treinador__c> obterPokemons() {
    return [
      SELECT Id, Name, Treinador__c, Treinador__r.Name
      FROM Pokemon_do_Treinador__c
    ];
  }
}
