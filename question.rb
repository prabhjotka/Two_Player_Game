class Question
    attr_accessor :number_1,:number_2,:add
    def initialize
        @number_1=rand(1..20)
        @number_2=rand(1..20)    
        @add="+" 
    end
    def new_question
        @question="what is #{self.number_1} #{self.add}  #{number_2} "
        @answer=self.number_1.send(self.add,self.number_2)
        return @question
    end
    def answer_question()
        ans=gets.chomp
        if ans==@answer.to_s
            return true
         else
            return false
          
         end
   
       end  

end

