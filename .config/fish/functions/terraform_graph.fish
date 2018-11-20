function terraform_graph
	terraform graph -verbose | dot -Tpng > graph.png ; and imgcat graph.png
end
