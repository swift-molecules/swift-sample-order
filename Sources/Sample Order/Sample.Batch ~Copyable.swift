public import Comparison
@_exported public import Order
public import Order_Comparison
public import Sample

extension Sample.Batch where Element: ~Copyable {

    @inlinable
    public init(
        count: Int,
        sortedBy comparator: Order.Comparator<Element>,
        initializingWith body: (Int) -> Element
    ) {
        self.init(
            count: count,
            sortedBy: { comparator($0, $1).isLess },
            initializingWith: body
        )
    }
}
