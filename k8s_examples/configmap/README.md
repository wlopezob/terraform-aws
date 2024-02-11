kc create configmap game-config-2 --from-file=game.properties

kc create configmap special-config --from-literal=special.how=very --from-literal=special.type=charm