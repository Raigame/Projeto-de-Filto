function CompReal = Componente(ideal,valor,tipo)
    
    [~,pos] = min(abs(valor-ideal));
    CompReal = valor(pos);

    if strcmp(tipo,'L')
        fprintf("Indutor real: %.2f mH\n", CompReal)
    elseif strcmp(tipo,'C')
        fprintf("Capacitor real: %.2f µF\n", CompReal)
    end
end