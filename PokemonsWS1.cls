@RestResource(urlMapping='/pokemons')
global class PokemonsWS {
  @HttpGet
  global static List<PokemonBO> obterPokemons() {
    List<Pokemon_do_Treinador__c> pokemons = [
      SELECT Id, Name, Treinador__c, Treinador__r.Name FROM Pokemon_do_Treinador__c
    ];

    List<PokemonBO> novosPokemons = new List<PokemonBO>();

    for (Pokemon_do_Treinador__c pokemon : pokemons) {
      PokemonBO pokemonbo = new PokemonBO();

      pokemonbo.nome = pokemon.Name;
      pokemonbo.nomeTreinador = pokemon.Treinador__r.Name;
      pokemonbo.idTreinador = pokemon.Treinador__c;

      novosPokemons.add(pokemonbo);
    }

    return novosPokemons;
  }

  global class PokemonBO {
    global String nome;
    global String nomeTreinador;
    global String idTreinador;
  }
}
