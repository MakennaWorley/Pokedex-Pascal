program PokedexApp;

uses
    StrUtils, SysUtils;

type (* Using the csv from functional *)
    TPokemon = record
        dexnum: String;
        name: String;
        generation: Integer;
        type1: String;
        type2: String;
        species: String;
        height: Extended;
        weight: Extended;
        ability1: String;
        ability2: String;
        hidden_ability: String;
        hp: Integer;
        attack: Integer;
        defense: Integer;
        sp_atk: Integer;
        sp_def: Integer;
        speed: Integer;
        total: Integer;
        catch_rate: Integer;
    end;

var
    pokedex: array of TPokemon;
    totalPokemon: Integer;
    pokemonFile: Text;
    line: String;
    option: Integer;

procedure ReadInAndParseCSV;
var
    i: Integer;
begin
    Assign(pokemonFile, 'pokemondb.csv');
    Reset(pokemonFile);
    i := 0;

    ReadLn(pokemonFile, line); (* get rid of headers *)
    SetLength(pokedex, 1);

    repeat
        if i >= Length(pokedex) then
            SetLength(pokedex, i+1);
        ReadLn(pokemonFile, line);

        pokedex[i].dexnum := ExtractDelimited(1, line, [',']);
        pokedex[i].name := ExtractDelimited(2, line, [',']);
        pokedex[i].generation := StrToInt(ExtractDelimited(3, line, [',']));
        pokedex[i].type1 := ExtractDelimited(4, line, [',']);
        pokedex[i].type2 := ExtractDelimited(5, line, [',']);
        pokedex[i].species := ExtractDelimited(6, line, [',']);
        pokedex[i].height := StrToFloat(ExtractDelimited(7, line, [',']));
        pokedex[i].weight := StrToFloat(ExtractDelimited(8, line, [',']));
        pokedex[i].ability1 := ExtractDelimited(9, line, [',']);
        pokedex[i].ability2 := ExtractDelimited(10, line, [',']);
        pokedex[i].hidden_ability := ExtractDelimited(11, line, [',']);
        pokedex[i].hp := StrToInt(ExtractDelimited(12, line, [',']));
        pokedex[i].attack := StrToInt(ExtractDelimited(13, line, [',']));
        pokedex[i].defense := StrToInt(ExtractDelimited(14, line, [',']));
        pokedex[i].sp_atk := StrToInt(ExtractDelimited(15, line, [',']));
        pokedex[i].sp_def := StrToInt(ExtractDelimited(16, line, [',']));
        pokedex[i].speed := StrToInt(ExtractDelimited(17, line, [',']));
        pokedex[i].total := StrToInt(ExtractDelimited(18, line, [',']));
        pokedex[i].catch_rate := StrToInt(ExtractDelimited(19, line, [',']));

        (* Testing *)
        (*WriteLn('Dexnum: ', pokedex[i].dexnum, ' | Name: ', pokedex[i].name,
                ' | Generation: ', pokedex[i].generation, ' | Primary Type: ', pokedex[i].type1,
                ' | Secondary Type: ', pokedex[i].type2, ' | HP: ', pokedex[i].hp,
                ' | Attack: ', pokedex[i].attack, ' | Defense: ', pokedex[i].defense,
                ' | Sp. Atk: ', pokedex[i].sp_atk, ' | Sp. Def: ', pokedex[i].sp_def,
                ' | Speed: ', pokedex[i].speed, ' | Total: ', pokedex[i].total, ' | Catch Rate: ', pokedex[i].catch_rate);*)

        Inc(i);

    until EOF(pokemonFile);

    totalPokemon := i;
    Close(pokemonFile);
end;


procedure DisplayPokedex;
var
    i: Integer;
begin
    for i := 0 to totalPokemon - 1 do
    begin
        WriteLn('Dexnum: ', pokedex[i].dexnum, ' | Name: ', pokedex[i].name,
                ' | Generation: ', pokedex[i].generation, ' | Primary Type: ', pokedex[i].type1,
                ' | Secondary Type: ', pokedex[i].type2, ' | HP: ', pokedex[i].hp,
                ' | Attack: ', pokedex[i].attack, ' | Defense: ', pokedex[i].defense,
                ' | Sp. Atk: ', pokedex[i].sp_atk, ' | Sp. Def: ', pokedex[i].sp_def,
                ' | Speed: ', pokedex[i].speed, ' | Total: ', pokedex[i].total,
                ' | Catch Rate: ', pokedex[i].catch_rate);
    end;
end;


procedure AddPokemon;
var
    newPokemon: TPokemon;
    i: Integer;
begin
    i := Length(pokedex);
    SetLength(pokedex, i + 1);

    newPokemon.dexnum := IntToStr(Length(pokedex));
    Write('Enter Name: ');
    ReadLn(newPokemon.name);
    Write('Enter Generation: ');
    ReadLn(newPokemon.generation);
    Write('Enter Primary Type: ');
    ReadLn(newPokemon.type1);
    Write('Enter Secondary Type (if none, press enter): ');
    ReadLn(newPokemon.type2);
    Write('Enter Species: ');
    ReadLn(newPokemon.species);
    Write('Enter Height: ');
    ReadLn(newPokemon.height);
    Write('Enter Weight: ');
    ReadLn(newPokemon.weight);
    Write('Enter First Ability: ');
    ReadLn(newPokemon.ability1);
    Write('Enter Second Ability (if none, press enter): ');
    ReadLn(newPokemon.ability2);
    Write('Enter Hidden Ability: ');
    ReadLn(newPokemon.hidden_ability);
    Write('Enter HP: ');
    ReadLn(newPokemon.hp);
    Write('Enter Attack: ');
    ReadLn(newPokemon.attack);
    Write('Enter Defense: ');
    ReadLn(newPokemon.defense);
    Write('Enter Special Attack: ');
    ReadLn(newPokemon.sp_atk);
    Write('Enter Special Defense: ');
    ReadLn(newPokemon.sp_def);
    Write('Enter Speed: ');
    ReadLn(newPokemon.speed);
    Write('Enter Total Stats: ');
    ReadLn(newPokemon.total);
    Write('Enter Catch Rate: ');
    ReadLn(newPokemon.catch_rate);

    pokedex[i] := newPokemon;
    Inc(totalPokemon);
    WriteLn('New Pokémon added successfully!');
end;


procedure UpdatePokemonHelper(var p: TPokemon);
var
    choice: Integer;
begin
    WriteLn('1. Name');
    WriteLn('2. Primary Type');
    WriteLn('3. Secondary Type');
    WriteLn('4. Species');
    WriteLn('5. Height');
    WriteLn('6. Weight');
    WriteLn('7. Ability 1');
    WriteLn('8. Ability 2');
    WriteLn('9. Hidden Ability');
    WriteLn('10. HP');
    WriteLn('11. Attack');
    WriteLn('12. Defense');
    WriteLn('13. Special Attack');
    WriteLn('14. Special Defense');
    WriteLn('15. Speed');
    WriteLn('16. Total Stats');
    WriteLn('17. Catch Rate');
    Write('Enter the number of the field you want to update: ');
    ReadLn(choice);

    case choice of
        1: begin
            Write('Enter new name: ');
            ReadLn(p.name);
        end;
        2: begin
            Write('Enter new primary type: ');
            ReadLn(p.type1);
        end;
        3: begin
            Write('Enter new secondary type: ');
            ReadLn(p.type2);
        end;
        4: begin
            Write('Enter new species: ');
            ReadLn(p.species);
        end;
        5: begin
            Write('Enter new height: ');
            ReadLn(p.height);
        end;
        6: begin
            Write('Enter new weight: ');
            ReadLn(p.weight);
        end;
        7: begin
            Write('Enter new ability 1: ');
            ReadLn(p.ability1);
        end;
        8: begin
            Write('Enter new ability 2: ');
            ReadLn(p.ability2);
        end;
        9: begin
            Write('Enter new hidden ability: ');
            ReadLn(p.hidden_ability);
        end;
        10: begin
            Write('Enter new HP: ');
            ReadLn(p.hp);
        end;
        11: begin
            Write('Enter new attack: ');
            ReadLn(p.attack);
        end;
        12: begin
            Write('Enter new defense: ');
            ReadLn(p.defense);
        end;
        13: begin
            Write('Enter new special attack: ');
            ReadLn(p.sp_atk);
        end;
        14: begin
            Write('Enter new special defense: ');
            ReadLn(p.sp_def);
        end;
        15: begin
            Write('Enter new speed: ');
            ReadLn(p.speed);
        end;
        16: begin
            Write('Enter new total stats: ');
            ReadLn(p.total);
        end;
        17: begin
            Write('Enter new catch rate: ');
            ReadLn(p.catch_rate);
        end;
    else
        WriteLn('Invalid option. Please try again.');
    end;

    WriteLn('Pokémon updated successfully!');
end;


procedure UpdatePokemon();
var
    dexnum, i: Integer;
begin
    WriteLn('Enter the dex number of the Pokémon you want to update:');
    ReadLn(dexnum);

    for i := 0 to totalPokemon - 1 do
        begin
            if pokedex[i].dexnum = IntToStr(dexnum) then
                begin
                    UpdatePokemonHelper(pokedex[i]);
                    Break;
                end;
        end;
end;


procedure WriteOutPokedex;
var
    i: Integer;
    outFile: Text;
begin
    Assign(outFile, 'pokedex_output.csv');
    Rewrite(outFile);

    WriteLn(outFile, 'dexnum,name,generation,type1,type2,species,height,weight,ability1,ability2,hidden_ability,hp,attack,defense,sp_atk,sp_def,speed,total,catch_rate');

    for i := 0 to totalPokemon - 1 do
    begin
        WriteLn(outFile, pokedex[i].dexnum, ',', pokedex[i].name, ',', pokedex[i].generation, ',',
                pokedex[i].type1, ',', pokedex[i].type2, ',', pokedex[i].species, ',', 
                pokedex[i].height:0:2, ',', pokedex[i].weight:0:2, ',', pokedex[i].ability1, ',',
                pokedex[i].ability2, ',', pokedex[i].hidden_ability, ',', pokedex[i].hp, ',',
                pokedex[i].attack, ',', pokedex[i].defense, ',', pokedex[i].sp_atk, ',',
                pokedex[i].sp_def, ',', pokedex[i].speed, ',', pokedex[i].total, ',',
                pokedex[i].catch_rate);
    end;

    Close(outFile);
    WriteLn('Pokedex saved to pokedex_output.csv successfully!');
end;


procedure AverageStat;
var
    i, totalPokemonCount: Integer;
    statChoice: Integer;
    statSum: Extended;
    average: Extended;
begin
    WriteLn('Which stat would you like to average?');
    WriteLn('1. Height');
    WriteLn('2. Weight');
    WriteLn('3. HP');
    WriteLn('4. Attack');
    WriteLn('5. Defense');
    WriteLn('6. Special Attack');
    WriteLn('7. Special Defense');
    WriteLn('8. Speed');
    WriteLn('9. Total');
    WriteLn('10. Catch Rate');
    Write('Choose a stat (1-10): ');
    ReadLn(statChoice);

    if (statChoice < 1) or (statChoice > 10) then
    begin
        WriteLn('Invalid choice. Please choose a number between 1 and 10.');
        Exit;
    end;
    
    statSum := 0;
    totalPokemonCount := 0;
    
    for i := 0 to totalPokemon - 1 do
    begin
        case statChoice of
            1: statSum := statSum + pokedex[i].height;
            2: statSum := statSum + pokedex[i].weight;
            3: statSum := statSum + pokedex[i].hp;
            4: statSum := statSum + pokedex[i].attack;
            5: statSum := statSum + pokedex[i].defense;
            6: statSum := statSum + pokedex[i].sp_atk;
            7: statSum := statSum + pokedex[i].sp_def;
            8: statSum := statSum + pokedex[i].speed;
            9: statSum := statSum + pokedex[i].total;
            10: statSum := statSum + pokedex[i].catch_rate;
        else
            WriteLn('Invalid choice.');
            Exit;
        end;
        totalPokemonCount := totalPokemonCount + 1;
    end;

    if totalPokemonCount > 0 then
    begin
        average := statSum / totalPokemonCount;
        WriteLn('The average of the chosen stat is: ', average:0:2);
    end
    else
    begin
        WriteLn('No Pokémon available for averaging.');
    end;
end;


begin
    ReadInAndParseCSV;

    repeat
        WriteLn('--- Pokedex Menu ---');
        WriteLn('1. Display all Pokémon');
        WriteLn('2. Add new Pokémon');
        WriteLn('3. Update existing Pokémon');
        WriteLn('4. Calculate Average of a Stat');
        WriteLn('5. Save changes');
        WriteLn('Other: Exit');
        Write('Choose an option: ');
        ReadLn(option);

        case option of
            1: DisplayPokedex;
            2: AddPokemon;
            3: UpdatePokemon;
            4: AverageStat;
            5: WriteOutPokedex;
        else
            WriteLn('Exiting.');
        end;
    until option = 6;
end.