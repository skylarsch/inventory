class ReportPresenter
  def initialize(boxes)
    @boxes = boxes
  end

  def to_s
    YAML.dump(to_h)
  end

  def to_h
    {}.tap do |hash|
      @boxes.each do |box|
        hash[box.tag] = box_hash(box).stringify_keys
      end
    end
  end

  private

  def box_hash(box)
    {
      type: box.kind,
      location: box.location,
      created_at: box.created_at.utc.iso8601,
      items: box.items.map(&:name)
    }
  end
end
