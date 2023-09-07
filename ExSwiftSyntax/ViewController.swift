//
//  ViewController.swift
//  ExSwiftSyntax
//
//  Created by 김종권 on 2023/09/08.
//

import UIKit
import SwiftSyntax
import SwiftParser
import SwiftSyntaxParser

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Swift 코드 파일을 읽기
        
        let sourceCode = """
            func sayHello() {
                print("Hello, World!")
            }
            """
        
        // SwiftSyntax를 사용하여 코드를 파싱
        let syntax = try! SyntaxParser.parse(source: sourceCode)
        
        // SyntaxVisitor를 사용하여 함수 선언을 찾아 출력
        let visitor = FunctionDeclarationVisitor()
        visitor.walk(syntax)
    }
}

// SyntaxVisitor 클래스를 정의
class FunctionDeclarationVisitor: SyntaxVisitor {
    override func visit(_ node: FunctionDeclSyntax) -> SyntaxVisitorContinueKind {
        print("Function Name: \(node.identifier.text)")
        return .skipChildren
    }
}
