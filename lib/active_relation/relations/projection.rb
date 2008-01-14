module ActiveRelation
  class Projection < Compound
    attr_reader :attributes

    def initialize(relation, *attributes)
      @relation, @attributes = relation, attributes
    end

    def ==(other)
      self.class == other.class and relation == other.relation and attributes == other.attributes
    end

    def qualify
      Projection.new(relation.qualify, *attributes.collect(&:qualify))
    end
  end
end