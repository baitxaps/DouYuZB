//
//  AdvanceLearning.swift
//  DW_iOS
//
//  Created by hairong chen on 2020/3/26.
//  Copyright © 2020 @huse.cn. All rights reserved.
//

import UIKit

enum TestEnum {
    case test1,test2,test3
}

enum EnAssociatedEnum {
    case test1(Int, Int, Int)
    case test2(Int, Int)
    case test3(Int)
    case test4(Bool)
    case test5
    // 1个字节存储成员值
    // N个字节存储关联值（N取占用内存最大的关联值），任何一个case的关联值都共用这N个字节
    // 共用体
}

class SeniorLearning: NSObject {
    func testEnum() {
        var t = TestEnum.test1
        t = .test2
        t = .test3
        print(Mems.ptr(ofVal: &t))
        
        print(MemoryLayout<TestEnum>.size)
        print(MemoryLayout<TestEnum>.stride)
        print(MemoryLayout<TestEnum>.alignment)
    }

}

/*
 1.
 寄存器读值：register read rax  / register read: 所有寄存器的值
 寄存器写值：register write rax 0x1
 读取内存中的值：x/数量-格式-字节大小 内存地址 -> x/3xw 0x00000010
 
 2.
 thread step-over,next, n, ni(汇编一步一步执行)
 thread step-in,  step, s, si(汇编一步一步执行) 进入函数体
 finish : 函数体直接跳出到断点
 
 3.内存地址格式：0x4bdc(%rip) ,全局变量，全局区(数据段)
              -0x78(%rbp),局部变量,栈空间
              0x10(%rax),一般是堆空间
 
 4. 16个常用寄存器
 rax,rbx,rcx,rdx,rsi,rdi,rbp,rsp
 r8,r9,r10,r11,r12,r13,r14,r15
 rax:常作函数返回值使用
 rdi,rsi,rdx,rcx,r8,r9:等寄存器常用于存放函数参数
 rsp,rbp:用于栈操作
 rip 作为指令指针，存储着CPU下一条要执行的指令的地址
 一旦CPU读取一条指令，rip会自动指向下一条指令（存储下一条指令的地址）
 
 5.[xx.class] = xx.self
 
 6. 计算属性，本质是方法，不占用实例的内存
 在初始化器中设置属性不会触发willSet didSet
 
 8.Any:任意类型：枚举，结构体，类，函数类型
   AnyObject:代表任意类类型，(在协议后写上AnyObject代表只有类能遵守这个协议)
*/

// 7. 下标重写
class Cirle {
    var radius:Int = 0
    var diameter:Int {
        set {
            print("circle SetDiameter")
            radius = newValue / 2
        }
        get {
            print("circle getDiameter")
            return radius * 2
        }
    }
}

class SubCircle:Cirle {
    override var radius:Int {
        set {
            print("SubCircle SetRadius")
            super.radius = newValue > 0 ? newValue:0
        }
        get {
            print("SubCircle getRadius")
            return super.radius * 2
        }
    }
    
    override var diameter:Int {
         set {
            print("SubCircle SetDiameter")
            super.diameter = newValue > 0 ? newValue:0
         }
         get {
            print("SubCircle getDiameter")
            return super.radius
         }
     }
}

func TestSubcribe() {
    var circle:Cirle = Cirle()
    circle.radius = 6
    print(circle.diameter)//circle getDiameter 12

    circle.diameter = 20
    print(circle.radius)//circle SetDiameter   10
    
    circle = SubCircle()
    circle.radius = 6   //SubCircle SetRadius    SubCircle getDiameter    6
    print(circle.diameter)
    
    circle.diameter = 20
    print(circle.radius)
    /*
    SubCircle SetDiameter
    circle SetDiameter
    SubCircle SetRadius
    SubCircle getRadius
    20
     */
}
