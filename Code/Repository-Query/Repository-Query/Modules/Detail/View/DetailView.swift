//  
//  DetailView.swift
//  Repository-Query
//
//  Created by Lorrayne Paraiso on 06/05/20.
//  Copyright © 2020 Zee-Dog. All rights reserved.
//

import UIKit

protocol DetailViewDelegate: class {
    func navigateToPreviousPage()
}

class DetailView: UIViewController {

    // OUTLETS HERE
    @IBOutlet weak var readmeImageView: UIImageView!
    // VARIABLES HERE
    var viewModel = DetailViewModel()
    weak var delegate: DetailViewDelegate?
    let teste = "IyBpb3MtbGVhcm5pbmctbWF0ZXJpYWxzIFshW0F3ZXNvbWVdKGh0dHBzOi8v\nY2RuLnJhd2dpdC5jb20vc2luZHJlc29yaHVzL2F3ZXNvbWUvZDczMDVmMzhk\nMjlmZWQ3OGZhODU2NTJlM2E2M2UxNTRkZDhlODgyOS9tZWRpYS9iYWRnZS5z\ndmcpXShodHRwczovL2dpdGh1Yi5jb20vc2luZHJlc29yaHVzL2F3ZXNvbWUp\nCgpbIVtMYW5ndWFnZV0oaHR0cHM6Ly9pbWcuc2hpZWxkcy5pby9iYWRnZS9M\nYW5ndWFnZS1Td2lmdC1ncmVlbi5zdmcpXSgpClshW0ZvdW5kZWRdKGh0dHBz\nOi8vaW1nLnNoaWVsZHMuaW8vYmFkZ2UvRm91bmRlZC1BdWd1c3RfMjAxNy1m\nZjY5YjQuc3ZnKV0oKQpbIVtNYXRlcmlhbHNdKGh0dHBzOi8vaW1nLnNoaWVs\nZHMuaW8vYmFkZ2UvTWF0ZXJpYWxzLTE4NTMtaW1wb3J0YW50LnN2ZyldKCkK\nWyFbTWFqb3JUb3BpY3NdKGh0dHBzOi8vaW1nLnNoaWVsZHMuaW8vYmFkZ2Uv\nTWFqb3JfVG9waWNzLTgwLXJlZC5zdmcpXSgpClshW0NvbnRyaWJ1dG9yc10o\naHR0cHM6Ly9pbWcuc2hpZWxkcy5pby9iYWRnZS9Db250cmlidXRvcnMtOC1p\nbmZvcm1hdGlvbmFsLnN2ZyldKCkKWyFbTGljZW5zZV0oaHR0cHM6Ly9pbWcu\nc2hpZWxkcy5pby9iYWRnZS9MaWNlbnNlLU1JVC1ibHVlLnN2ZyldKCkKCioq\nTGFzdCBVcGRhdGU6IDA1L01heS8yMDIwLioqCgohW10obG9nby1hbHRlcm5h\ndGl2ZS5qcGcpCgojIyMgSWYgeW91IGxpa2UgdGhlIHByb2plY3QsIHBsZWFz\nZSBnaXZlIGl0IGEgc3RhciDirZAgSXQgd2lsbCBzaG93IHRoZSBjcmVhdG9y\nIHlvdXIgYXBwcmVjaWF0aW9uIGFuZCBoZWxwIG90aGVycyB0byBkaXNjb3Zl\nciB0aGUgcmVwby4KCiMg4pyN77iPIEFib3V0CgpDdXJhdGVkIGxpc3Qgb2Yg\nYXJ0aWNsZXMsIHdlYi1yZXNvdXJjZXMsIHR1dG9yaWFscywgYFN0YWNrIE92\nZXJmbG93YCBhbmQgYFF1b3JhYCBRJkEsIGBHaXRIdWJgY29kZSByZXBvc2l0\nb3JpZXMgYW5kIHVzZWZ1bCByZXNvdXJjZXMgdGhhdCBtYXkgaGVscCB5b3Ug\nZGlnIGEgbGl0dGxlIGJpdCBkZWVwZXIgaW50byBpT1MuIEFsbCB0aGUgcmVz\nb3VyY2VzIGFyZSBzcGxpdCBpbnRvIHN1Yi1jYXRlZ29yaWVzIHdoaWNoIHNp\nbWxpZmllcyBuYXZpZ2F0aW9uIGFuZCBtYW5hZ2VtZW50LiBGZWVsIGZyZWUg\ndG8gdXNlIGFuZCBzdWdnZXN0IHNvbWV0aGluZyB0byBsZWFybiAoaU9TIHJl\nbGF0ZWQgb2YgY291cnNlIPCfmJwpLgoKWW91IG1heSBzZWUgc29tZSBub24t\nZGlyZWN0bHkgcmVsYXRlZCB0b3BpY3Mgc3VjaCBhcyBgQ29tcHV0ZXIgR3Jh\ncGhpY3NgLCBgTWFjaGluZSBMZWFybmluZ2Agb3IgYERlc2lnbiBQYXR0ZXJu\nc2AgLSB0aGVzZSBhcmUgYWN0dWFsbHkgcmVsYXRlZCwgaW4gc29tZSB3YXlz\nLCB0byBgaU9TYCBkZXZlbG9wbWVudCwgYnV0IGluIGEgbXVjaCBicm9hZGVy\nIGFuZCBtb3JlIHNwZWNpZmljIHdheS4gV2l0aCB0aGUgYWRkaXRpb24gb2Yg\nbmV3IG1hdGVyaWFscywgdGhlIHN0cnVjdHVyZSBvZiB0aGUgZG9jdW1lbnQg\nd2lsbCBiZSBwcm9wZXJseSBtYWludGFpbmVkIG1lYW5pbmcgdGhhdCBpdCB3\naWxsIGJlY29tZSBhIHJlZmVyZW5jZSBib29rIGZvciBsZWFybmluZy4gSGFw\ncHkgZXZvbHZpbmcg8J+kkzpvY3RvY2F0OgoKIyDwn5OdIENvbnRlbnQKCi0g\nW0Fib3V0XSgjYWJvdXQpCi0gW0FtYXppbmcgTWF0ZXJpYWxzXShMaXN0cy9B\nbWF6aW5nTWF0ZXJpYWxzLm1kKQotIFtTd2lmdFVJXShMaXN0cy9Td2lmdFVJ\nLm1kKQotIFtBUktpdF0oTGlzdHMvQVJLaXQubWQpCi0gW1NjZW5lS2l0XShM\naXN0cy9TY2VuZUtpdC5tZCkKLSBbU3ByaXRlS2l0XShMaXN0cy9TcHJpdGVL\naXQubWQpCi0gW0dhbWVwbGF5S2l0XShMaXN0cy9HYW1lcGxheUtpdC5tZCkK\nLSBbUmVwbGF5S2l0XShMaXN0cy9SZXBsYXlLaXQubWQpCi0gW01hcEtpdF0o\nTGlzdHMvTWFwS2l0Lm1kKQotIFtVSUtpdF0oTGlzdHMvVUlLaXQubWQpCi0g\nW1Bob3RvS2l0XShMaXN0cy9QaG90b0tpdC5tZCkKLSBbSGVhbHRoS2l0XShM\naXN0cy9IZWFsdGhLaXQubWQpCi0gW0Nsb3VkS2l0XShMaXN0cy9DbG91ZEtp\ndC5tZCkKLSBbVGV4dEtpdF0oTGlzdHMvVGV4dEtpdC5tZCkKLSBbU3RvcmVL\naXRdKExpc3RzL1N0b3JlS2l0Lm1kKQotIFtTaXJpS2l0XShMaXN0cy9TaXJp\nS2l0Lm1kKQotIFtDYWxsS2l0XShMaXN0cy9DYWxsS2l0Lm1kKQotIFtQdXNo\nS2l0XShMaXN0cy9QdXNoS2l0Lm1kKQotIFtNZXRyaWNLaXRdKExpc3RzL01l\ndHJpY0tpdC5tZCkKLSBbQ29yZU1MXShMaXN0cy9Db3JlTUwubWQpCi0gW0Ny\nZWF0ZU1MXShMaXN0cy9DcmVhdGVNTC5tZCkKLSBbQ29yZSBBbmltYXRpb25d\nKExpc3RzL0NvcmVBbmltYXRpb24ubWQpCi0gW0NvcmUgR3JhcGhpY3NdKExp\nc3RzL0NvcmVHcmFwaGljcy5tZCkKLSBbQ29yZSBJbWFnZV0oTGlzdHMvQ29y\nZUltYWdlLm1kKQotIFtDb3JlIExvY2F0aW9uXShMaXN0cy9Db3JlTG9jYXRp\nb24ubWQpCi0gW0NvcmUgRGF0YV0oTGlzdHMvQ29yZURhdGEubWQpCi0gW0Nv\ncmUgTW90aW9uXShMaXN0cy9Db3JlTW90aW9uLm1kKQotIFtDb3JlTkZDXShM\naXN0cy9Db3JlTkZDLm1kKQotIFtDb21iaW5lXShMaXN0cy9Db21iaW5lLm1k\nKQotIFtNZXRhbF0oTGlzdHMvTWV0YWwubWQpCi0gW1Zpc2lvbl0oTGlzdHMv\nVmlzaW9uLm1kKQotIFtBVkZvdW5kYXRpb25dKExpc3RzL0FWRm91bmRhdGlv\nbi5tZCkKLSBbQXBwS2l0XShMaXN0cy9BcHBLaXQubWQpCi0gW1NlYXJjaEtp\ndF0oTGlzdHMvU2VhcmNoS2l0Lm1kKQotIFtBdXRvIExheW91dF0oTGlzdHMv\nQXV0b0xheW91dC5tZCkKLSBbQXV0aGVudGljYXRpb25TZXJ2aWNlc10oTGlz\ndHMvQXV0aGVudGljYXRpb25TZXJ2aWNlcy5tZCkKLSBbUHJvamVjdCBDYXRh\nbHlzdF0oTGlzdHMvUHJvamVjdENhdGFseXN0Lm1kKQotIFtBc3NldCBDYXRh\nbG9nXShMaXN0cy9Bc3NldENhdGFsb2cubWQpCi0gW1BsYXlncm91bmRzXShM\naXN0cy9QbGF5Z3JvdW5kcy5tZCkKLSBbSW4tQXBwIFB1cmNoYXNlXShMaXN0\ncy9JbkFwcFB1cmNoYXNlLm1kKQotIFtBdXRvIEZpbGxdKExpc3RzL0F1dG9G\naWxsLm1kKQotIFtOTFBdKExpc3RzL05MUC5tZCkKLSBbRm91bmRhdGlvbl0o\nTGlzdHMvRm91bmRhdGlvbi5tZCkKLSBbU3dpZnRdKExpc3RzL1N3aWZ0Lm1k\nKQotIFtTd2lmdCBQYWNrYWdlIE1hbmFnZXJdKExpc3RzL1N3aWZ0UGFja2Fn\nZU1hbmFnZXIubWQpCi0gW1hjb2RlXShMaXN0cy9YY29kZS5tZCkKLSBbUGVy\nc2lzdGVuY2VdKExpc3RzL1BlcnNpc3RlbmNlLm1kKQotIFtJbnRlcm5hdGlv\nbmFsaXphdGlvbiAmIExvY2FsaXphdGlvbl0oTGlzdHMvSW50ZXJuYXRpb25h\nbGl6YXRpb25BbmRMb2NhbGl6YXRpb24ubWQpCi0gW1NlY3VyaXR5XShMaXN0\ncy9TZWN1cml0eS5tZCkKLSBbUGF5bWVudHNdKExpc3RzL1BheW1lbnRzLm1k\nKQotIFtEb2N1bWVudCBCYXNlZCBBcHBzXShMaXN0cy9Eb2N1bWVudEJhc2Vk\nQXBwcy5tZCkKLSBbTmV0d29ya2luZ10oTGlzdHMvTmV0d29ya2luZy5tZCkK\nLSBbRnJhbWV3b3JrcyBEZXZlbG9wbWVudF0oTGlzdHMvRnJhbWV3b3Jrc0Rl\ndmVsb3BtZW50Lm1kKQotIFtEZWJ1Z2dpbmddKExpc3RzL0RlYnVnZ2luZy5t\nZCkKLSBbVGVzdGluZ10oTGlzdHMvVGVzdGluZy5tZCkKLSBbQXBwIFN1Ym1p\nc3Npb25dKExpc3RzL0FwcFN1Ym1pc3Npb24ubWQpCi0gW0FwcCBFeHRlbnNp\nb25zXShMaXN0cy9BcHBFeHRlbnNpb25zLm1kKQotIFtXV0RDXShMaXN0cy9X\nV0RDLm1kKQotIFtHaXRdKExpc3RzL0dpdC5tZCkKLSBbRGV2ZWxvcG1lbnRd\nKExpc3RzL0RldmVsb3BtZW50Lm1kKQotIFtBbGdvcml0aG1zIGFuZCBEYXRh\nIFN0cnVjdHVyZXNdKExpc3RzL0FsZ29yaXRobXNBbmREYXRhU3RydWN0dXJl\ncy5tZCkKLSBbQXN5bmNocm9ub3VzIFByb2dyYW1taW5nXShMaXN0cy9Bc3lu\nY2hyb25vdXNQcm9ncmFtbWluZy5tZCkKLSBbRnVuY3Rpb25hbCBQcm9ncmFt\nbWluZ10oTGlzdHMvRnVuY3Rpb25hbFByb2dyYW1taW5nLm1kKQotIFtQcm90\nb2NvbC1PcmllbnRlZCBQcm9ncmFtbWluZ10oTGlzdHMvUHJvdG9jb2xPcmll\nbnRlZFByb2dyYW1taW5nLm1kKQotIFtBcmNoaXRlY3R1cmUgQW5kIERlc2ln\nbiBQYXR0ZXJuc10oTGlzdHMvQXJjaGl0ZWN0dXJlQW5kRGVzaWduUGF0dGVy\nbnMubWQpCi0gW1Rlc3QgRHJpdmVuIERldmVsb3BtZW50XShMaXN0cy9UZXN0\nRHJpdmVuRGV2ZWxvcG1lbnQubWQpCi0gW0NsZWFuIENvZGVdKExpc3RzL0Ns\nZWFuQ29kZS5tZCkKLSBbQ29udGludW91cyBJbnRlZ3JhdGlvbiAoQ0kpXShM\naXN0cy9Db250aW51b3VzSW50ZWdyYXRpb24ubWQpCi0gW0NvbXB1dGVyIEdy\nYXBoaWNzXShMaXN0cy9Db21wdXRlckdyYXBoaWNzLm1kKQotIFtNYWNoaW5l\nIExlYXJuaW5nXShMaXN0cy9NYWNoaW5lTGVhcm5pbmcubWQpCi0gW0FwcCBE\naXN0cmlidXRpb25dKExpc3RzL0FwcERpc3RyaWJ1dGlvbi5tZCkKLSBbRGVw\nZW5kZW5jeSBNYW5hZ2VtZW50XShMaXN0cy9EZXBlbmRlbmN5TWFuYWdlbWVu\ndC5tZCkKLSBbUGh5c2ljcyBFbmdpbmVzXShMaXN0cy9QaHlzaWNzRW5naW5l\ncy5tZCkKLSBbRnJhbWV3b3JrcywgTGlicmFyaWVzLCBQbGF0Zm9ybXNdKExp\nc3RzL0ZyYW1ld29ya3NMaWJyYXJpZXNQbGF0Zm9ybXMubWQpCi0gW1N3aWZ0\nU3ludGF4XShMaXN0cy9Td2lmdFN5bnRheC5tZCkKLSBbRGVzaWduXShMaXN0\ncy9EZXNpZ24ubWQpCi0gW1VYXShMaXN0cy9VWC5tZCkKLSBbQWNjZXNzaWJp\nbGl0eV0oTGlzdHMvQWNjZXNzaWJpbGl0eS5tZCkKLSBbSW50ZXJ2aWV3XShM\naXN0cy9JbnRlcnZpZXcubWQpCi0gW0J1c2luZXNzXShMaXN0cy9CdXNpbmVz\ncy5tZCkKLSBbUHJvamVjdCBNYW5hZ2VtZW50XShMaXN0cy9Qcm9qZWN0TWFu\nYWdlbWVudC5tZCkKCiMg8J+RqOKAjfCfkrsgQXV0aG9yCgpbQXN0ZW1pciBF\nbGVldl0oaHR0cHM6Ly9naXRodWIuY29tL2pWaXJ1cykKCiMg8J+Zi+KAjeKZ\ngO+4j/CfmYvigI3imYLvuI8gQ29udHJpYnV0b3JzCgotIFtaYWthcmlhIEJy\nYWtzYV0oaHR0cHM6Ly9naXRodWIuY29tL25zYnJha3NhKQotIFtMaXNhIER6\naXViYV0oaHR0cHM6Ly9naXRodWIuY29tL0xpc2FEeml1YmEpCi0gW1NlbWVu\nIFpoeWRlbmtvXShodHRwczovL2dpdGh1Yi5jb20vc3MxOCkKLSBbVjh0cl0o\naHR0cHM6Ly9naXRodWIuY29tL1Y4dHIpCi0gW1lVQU1JTkddKGh0dHBzOi8v\nZ2l0aHViLmNvbS95dWFtaW5nKQotIFtPemd1ciBTYWhpbl0oaHR0cHM6Ly9n\naXRodWIuY29tL296Z3Vyc2huKQotIFtKci4gS2VuIEouXShodHRwczovL2dp\ndGh1Yi5jb20va2Vuam9uZXNqcikKLSBbVW1hciBIYXJvb25dKGh0dHBzOi8v\nZ2l0aHViLmNvbS9VbWFyLU0tSGFyb29uKQoKIyDwn5SWIExpY2VuY2UKVGhl\nIHByb2plY3QgaXMgYXZhaWxhYmUgdW5kZXIgW01JVCBMaWNlbmNlXShodHRw\nczovL2dpdGh1Yi5jb20valZpcnVzL2lvcy1sZWFybmluZy1tYXRlcmlhbHMv\nYmxvYi9tYXN0ZXIvTElDRU5TRSkK"
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Nome do repositório"
        self.setupViewModel()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        self.renderReadme(content: self.teste)
    }
    fileprivate func setupViewModel() {

        self.viewModel.showAlertClosure = {
            let alert = self.viewModel.alertMessage ?? ""
            print(alert)
        }
        
        self.viewModel.updateLoadingStatus = {
            if self.viewModel.isLoading {
                print("LOADING...")
            } else {
                 print("DATA READY")
            }
        }

        self.viewModel.internetConnectionStatus = {
            print("Internet disconnected")
            // show UI Internet is disconnected
        }

        self.viewModel.serverErrorStatus = {
            print("Server Error / Unknown Error")
            // show UI Server is Error
        }

        self.viewModel.didGetData = {
            DispatchQueue.main.async {
                self.renderReadme(content: self.teste)
            }
        }

    }

    fileprivate func renderReadme(content: String) {
        readmeImageView.image = base64Convert(base64String: content)
    }

    func base64Convert(base64String: String) -> UIImage{
        if (base64String.isEmpty) {
            return #imageLiteral(resourceName: "no_image_found")
        }else {
            let dataDecoded : Data = Data(base64Encoded: base64String, options: .ignoreUnknownCharacters)!
            let decodedimage = UIImage(data: dataDecoded)
            return decodedimage!
        }
    }
}


