/** This object contains information related to the pagination of the current request, including the necessary parameters to get the next or previous page of data. */
public struct VPagination: VercelData {
  /** Amount of items in the current page. */
  public var count: Int
  /** Timestamp that must be used to request the next page. */
  public var next: Int?
  /** Timestamp that must be used to request the previous page. */
  public var prev: Int?
}
