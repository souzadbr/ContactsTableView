//
//  ViewController.swift
//  StarWarsApp
//
//  Created by Debora Rodrigues  on 04/01/23.
//

import UIKit

class ContactViewController: UIViewController {
    
    
    private let contacts = ContactAPI.getContacts() // model
    
    let contactsTableView = UITableView() // view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(contactsTableView)
        view.backgroundColor = UIColor(cgColor: .init(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1))
        contactsTableView.backgroundColor = .clear
        //Faz parte do Segundo passo:
        //Informar ao TableView de contatos onde seus métodos de protocolo de fonte de dados são implementados, neste caso, contactsViewController e em outras palavras, self.
        contactsTableView.dataSource = self
        contactsTableView.delegate = self
        //contactsTableView não sabe sobre esta célula. Vamos corrigi-lo registrando-o usando a string do identificador.
        // Acesse ViewDidLoad()no contactsViewControllere registre a célula no tableView.
        contactsTableView.register(ContactTableViewCell.self, forCellReuseIdentifier: "contactCell")
        setUpNavigation()
        applyContraints()
    }
    
    func applyContraints() {
        //1. primeiro Passo.
        //habilite o Auto Layout em contactsTableView definindo translatesAutoresizingMaskIntoConstraints como false.
        contactsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        //Defina o topAnchor de contactsTableView igual ao topAnchor da visualização principal.
        //Isso garantirá que o contactsTableView permaneça na parte superior da visualização principal.
        contactsTableView.topAnchor.constraint(equalTo:view.topAnchor).isActive = true
        //Vamos adicionar o código para as âncoras esquerda, direita e inferior semelhante ao código topAnchor.
        contactsTableView.leftAnchor.constraint(equalTo:view.leftAnchor).isActive = true
        contactsTableView.rightAnchor.constraint(equalTo:view.rightAnchor).isActive = true
        contactsTableView.bottomAnchor.constraint(equalTo:view.bottomAnchor).isActive = true
    }
    
    func setUpNavigation() {
        navigationItem.title = "Contacts"
        self.navigationController?.navigationBar.barTintColor = UIColor(cgColor: .init(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1))
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(cgColor: .init(red: 1, green: 1, blue: 1, alpha: 1))]
    }
}

extension ContactViewController: UITableViewDataSource {
    
    //2 passo entrar em conformidade com protocolo UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Retorna o numero de contatos presentes no array trasendo numero de linhas por sessão.
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //faz o resuso de celula formatada em contactCell retornando uma celula formatada.
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactTableViewCell
        cell.contact = contacts[indexPath.row]
        return cell
    }
}

extension ContactViewController: UITableViewDelegate {
    //Funcao usada para dar altura na célula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
