//
//  ContentView.swift
//  Budget App (CoreData)
//
//  Created by gabriel carreno on 9/3/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    
    
    @State var budgetcategory: Array<String> = []
    
    // data  for category prioritization
    
    @State var budgetamount: Array<Int> = []
    
    // data for budget sum
    
    
    enum prioritylevel
    
    {
        case high
        case low
    }
    
    // labels for category prioritization
    
    
    @State var showsheet = false
    @State var newitemfield  = ""
    @State var newitemfield2: Int?
    @State var expenseTab: Int?
    
    var body: some View {
        NavigationStack {
            
            
            
            NavigationView {
                
                // make add button add a groupbox..
                // so feautures for groubox can  be used within code
                // such as content and label
                // and to be able to delete an enite groupbox from a section
                
                //pseudo for groupbox will be ass follows
                // groupbox: view
                // Label
                // in HStack under label within groupbox // Content and subject
                // or space lis into groupbox configuratuion
                
                
                
                // learn how to code out a listing for budgetcategory array and also for budget amount but put into the same view
                
                
                Group {
                    if budgetcategory.count <= 1 && budgetamount.count <= 1  {
                        Text("No Item") }
                    else {
                        List((1...budgetcategory.count-1), id: \.self)
                                                                           { i in
                            Text(budgetcategory[i])
                                .contextMenu {
                                    Button(action: {
                                        budgetcategory.remove(at: i)
                                    }, label: {
                                        Label("Delete", systemImage: "delete.left")
                                    })
                                    
                                }
                            
                            
                            
                            
                        }
                        
                        
                        
                    }
                }
                .padding()
                .listRowSpacing(8.0)
                .listRowSeparator(.hidden)
                .navigationTitle("Budget")
                .navigationBarTitleDisplayMode(.inline)
                
            }
            Button(action:  {
                showsheet.toggle()
                newitemfield = ""
            }, label: {
                Image(systemName: "plus")
                    .foregroundColor(.gray)
            })
            .padding()
            
            HStack(alignment: .bottom) {
                
                Spacer()
                
                
                                // ASK TUTOR IF I CAN TURN back BUTTON BLACK
                                
                                    GroupBox(label: Text("Expenses"), content:  {
                                        Text("2000")  })
                
                                    .foregroundColor(.white)
                
                                
                
                                GroupBox(label: Text("Budget"), content: {
                                    Text("2500") })
                                .foregroundColor(.white)
                
                               
                                    GroupBox(label: Text("Income"), content: {
                                        Text("3200") })
                                    .foregroundColor(.white)
                               
                Spacer()
            }
            
            .onChange(of: budgetcategory) {
                save()
                load()
            }
            .onAppear() {
                save()
                load()
            }
            
            .refreshable {
                save()
                load()
            }
            
            .sheet(isPresented: $showsheet)  {
                NavigationStack {
                    VStack {
                        List {
                            TextField("Category", text: $newitemfield)
                            
                            TextField("Amount", value: $newitemfield2, formatter: NumberFormatter())
                                .keyboardType(.numberPad)
                            
                        }
                        
                        .navigationTitle("New Entry")
                        .toolbar{
                            Button("add") {
                                
                                
                                
                                budgetcategory.append(newitemfield)
                                budgetamount.append(newitemfield2 ?? 0)
                                showsheet.toggle()
                                
                                
                            }
                            .foregroundColor(.gray)
                            
                            //
                            
                        }
                     
                       

                    }
                }
                .presentationDetents([.height(300)])
            }
            

            
        }
        
        .preferredColorScheme(.dark)
    }
    
    
    
    func save() -> Void {
        let temp = budgetcategory.joined(separator: "/[split]/")
        let key = UserDefaults.standard
        key.set(temp, forKey: "budgetcategory")
    }
    func load() -> Void {
        let key = UserDefaults.standard
        let temp = key.string(forKey: "budgetcategory") ?? ""
        let temparray = temp.components(separatedBy: "/[split]/")
        budgetcategory = temparray
    }




}


    
#Preview {
    ContentView()
}
