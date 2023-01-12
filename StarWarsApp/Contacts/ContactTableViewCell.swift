//
//  HomeCell.swift
//  StarWarsApp
//
//  Created by Debora Rodrigues  on 04/01/23.
//

import Foundation
import UIKit

final class ContactTableViewCell: UITableViewCell {
    //propriedade computada contact dentro da classe ContactsTableViewCell com observador didSet. O código dentro do observador didSet será execultado toda vez que a propriedade de contato for definida.
    var contact: Contact? {
        didSet {
            guard let contactItem = contact else {return}
            if let name = contactItem.name {
                profileImageView.image = UIImage(named: name)
                nameLabel.text = name
            }
            if let jobTitle = contactItem.jobTitle {
                jobTitleDetailedLabel.text = "\(jobTitle)"
            }
            if let country = contactItem.country {
                countryImageView.image = UIImage(named: country)
            }
            //if let para desempacotar dados com seguranca e defini-los para exibição. 
        }
    }
    
    //propriedade instanciada é uma UIImageView dentro de uma função anonima
    let profileImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFit // a imagem nunca será esticada verticalmente ou horizontalmente
        img.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        img.layer.cornerRadius = 35 // arredonda a imageView
        img.clipsToBounds = true
        return img
    } ()
    
    //propriedade nameLAbel que é responsavel por mostrar o titulo no topo de cada célula.
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = UIColor(cgColor: .init(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1))
        label.translatesAutoresizingMaskIntoConstraints = false // ativa o layout automático
        return label
    } ()
    
    //propriedade chamada jobTitleDetailedLabel que mostrará o cargo sob o nomeLabel
    let jobTitleDetailedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(cgColor: .init(red: 0.2431372549, green: 0.7647058824, blue: 0.8392156863, alpha: 1))
        label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    //propriedade containerView que será um conteinar para nomeLabel e também para jobTitleDetailedLabel
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true //isso garantirá que seus filhos não saiam do limite
        return view
    } ()
    //o container tem como motivo adicionar ambos os rotulos a ele e centralizar verticalmente em relacao a exibição de conteudo da celula.
    
    //Crie uma propriedade countryImageView que mostrará a imagem da bandeira à direita.
    let countryImageView: UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill // sem isso sua imagem encolherá e ficará feia
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 13
        img.clipsToBounds = true
        return img
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(profileImageView)
        containerView.addSubview(nameLabel)
        containerView.addSubview(jobTitleDetailedLabel)
        self.contentView.addSubview(containerView)
        self.contentView.addSubview(countryImageView)
        applyContraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func applyContraints() {
        //profileImageView
        //na linha abaixo profileImageView será definidocentralizado verticalmente usando centerYAnchor em relação a exibição pai self.contentView
        profileImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        profileImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant:  10).isActive = true
        
        //Heigth e Width da imagem do perfil são definidos como 70 e seu cornerRadius deve ser metado do tamanho da altura para que tenha a imagem em forma de circulo
        profileImageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        profileImageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        
        //containerView
        containerView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        containerView.leadingAnchor.constraint(equalTo: self.profileImageView.trailingAnchor, constant: 10).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //nameLabel
        nameLabel.topAnchor.constraint(equalTo: self.containerView.topAnchor).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor).isActive = true
        
        //jobTitleDetaledLabel
        jobTitleDetailedLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor).isActive = true
        jobTitleDetailedLabel.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor).isActive = true
        jobTitleDetailedLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor).isActive = true
        
        //countryImageView
        countryImageView.widthAnchor.constraint(equalToConstant: 26).isActive = true
        countryImageView.heightAnchor.constraint(equalToConstant: 26).isActive = true
        countryImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        countryImageView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
}
