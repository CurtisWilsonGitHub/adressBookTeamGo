require_relative '../models/address_book'

class MenuController
    attr_reader :address_book

    def initialize
        @address_book = AddressBook.new
    end

    def main_menu

        puts "Main Menu - #{address_book.entries.count} entries"
        puts "1 - View All Entries"
        puts "2 - Create an entry"
        puts "3 - Search for an entry"
        puts "4 - Import entries from a CSV"
        puts "5 - View Entry Number n"
        puts "6 - Exit"
        print "enter your selection: "

        selection = gets.to_i
        
        case selection
            when 1
                system "clear"
                view_all_entries
                main_menu
            when 2
                system "clear"
                create_entry
                main_menu
            when 3
                system "clear"
                search_entries
                main_menu
            when 4
                system "clear"
                read_csv
                main_menu
            when 5
                system "clear"
                view_entry_number
                main_menu
            when 6
                puts "Good-Bye!"
                exit(0)
            else
                system "Clear"
                puts "Sorry, that is not a valid input"
                main_menu
        end
    end

    def view_all_entries

        address_book.entries.each do |entry|
             system "clear"
             puts entry.to_s

            entry_submenu(entry)
        end

        system "clear"
        puts "end of entries"
    end

    def create_entry

        system "clear"
        puts "New AddressBloc Entry"
        print "name: "
        name = gets.chomp
        print "Phone Number: "
        phone = gets.chomp
        print "Email: "
        email = gets.chomp

        address_book.add_entry(name,phone,email)
        system "clear"
        puts "New Entry Created"
    end

    def search_entries
    end

        
     def view_entry_number
            system "clear"
            puts "What is the entry number?"

            number = gets.chomp.to_i - 1
            
            if address_book.entries.at(number).nil?
                puts "Please select a valid entry number"
            else   
                puts address_book.entries.at(number)
            end
    end

            
    

    def entry_submenu(entry)

        puts "n - next entry"
        puts "d - delete entry"
        puts "e - edit  this entry"
        puts "m - return to main menu"

        selection = gets.chomp
        
        case selection
            when "n"

            when "d"
            when "e"

            when "m"
                system "clear"
                main_menu
            else
                system "clear"
                puts "#{selection} is not a valid input"
                entry_submenu(entry)
         end
     end
    
    
end