import SwiftUI

public enum FrostedIcon: String, CaseIterable, Identifiable {
    public var id: String { rawValue }

    case addUser12 = "add-user-12"
    case addUser16 = "add-user-16"
    case addUser20 = "add-user-20"
    case addUser24 = "add-user-24"
    case addUser32 = "add-user-32"
    case alignCenter12 = "align-center-12"
    case alignCenter16 = "align-center-16"
    case alignCenter20 = "align-center-20"
    case alignCenter24 = "align-center-24"
    case alignCenter32 = "align-center-32"
    case alignLeft12 = "align-left-12"
    case alignLeft16 = "align-left-16"
    case alignLeft20 = "align-left-20"
    case alignLeft24 = "align-left-24"
    case alignLeft32 = "align-left-32"
    case alignRight12 = "align-right-12"
    case alignRight16 = "align-right-16"
    case alignRight20 = "align-right-20"
    case alignRight24 = "align-right-24"
    case alignRight32 = "align-right-32"
    case apps12 = "apps-12"
    case apps16 = "apps-16"
    case apps20 = "apps-20"
    case apps24 = "apps-24"
    case apps32 = "apps-32"
    case arrowDown12 = "arrow-down-12"
    case arrowDown16 = "arrow-down-16"
    case arrowDown20 = "arrow-down-20"
    case arrowDown24 = "arrow-down-24"
    case arrowDown32 = "arrow-down-32"
    case arrowDownAngleLeft12 = "arrow-down-angle-left-12"
    case arrowDownAngleLeft16 = "arrow-down-angle-left-16"
    case arrowDownAngleLeft20 = "arrow-down-angle-left-20"
    case arrowDownAngleLeft24 = "arrow-down-angle-left-24"
    case arrowDownAngleLeft32 = "arrow-down-angle-left-32"
    case arrowDownAngleRight12 = "arrow-down-angle-right-12"
    case arrowDownAngleRight16 = "arrow-down-angle-right-16"
    case arrowDownAngleRight20 = "arrow-down-angle-right-20"
    case arrowDownAngleRight24 = "arrow-down-angle-right-24"
    case arrowDownAngleRight32 = "arrow-down-angle-right-32"
    case arrowDownLeft12 = "arrow-down-left-12"
    case arrowDownLeft16 = "arrow-down-left-16"
    case arrowDownLeft20 = "arrow-down-left-20"
    case arrowDownLeft24 = "arrow-down-left-24"
    case arrowDownLeft32 = "arrow-down-left-32"
    case arrowDownRight12 = "arrow-down-right-12"
    case arrowDownRight16 = "arrow-down-right-16"
    case arrowDownRight20 = "arrow-down-right-20"
    case arrowDownRight24 = "arrow-down-right-24"
    case arrowDownRight32 = "arrow-down-right-32"
    case arrowDownToLine12 = "arrow-down-to-line-12"
    case arrowDownToLine16 = "arrow-down-to-line-16"
    case arrowDownToLine20 = "arrow-down-to-line-20"
    case arrowDownToLine24 = "arrow-down-to-line-24"
    case arrowDownToLine32 = "arrow-down-to-line-32"
    case arrowDownToLineSize12 = "arrow-down-to-line-size-12"
    case arrowDownToLineSize16 = "arrow-down-to-line-size-16"
    case arrowDownToLineSize20 = "arrow-down-to-line-size-20"
    case arrowDownToLineSize24 = "arrow-down-to-line-size-24"
    case arrowDownToLineSize32 = "arrow-down-to-line-size-32"
    case arrowFatDown12 = "arrow-fat-down-12"
    case arrowFatDown16 = "arrow-fat-down-16"
    case arrowFatDown20 = "arrow-fat-down-20"
    case arrowFatDown24 = "arrow-fat-down-24"
    case arrowFatDown32 = "arrow-fat-down-32"
    case arrowFatDownFilled12 = "arrow-fat-down-filled-12"
    case arrowFatDownFilled16 = "arrow-fat-down-filled-16"
    case arrowFatDownFilled20 = "arrow-fat-down-filled-20"
    case arrowFatDownFilled24 = "arrow-fat-down-filled-24"
    case arrowFatDownFilled32 = "arrow-fat-down-filled-32"
    case arrowFatUp12 = "arrow-fat-up-12"
    case arrowFatUp16 = "arrow-fat-up-16"
    case arrowFatUp20 = "arrow-fat-up-20"
    case arrowFatUp24 = "arrow-fat-up-24"
    case arrowFatUp32 = "arrow-fat-up-32"
    case arrowFatUpFilled12 = "arrow-fat-up-filled-12"
    case arrowFatUpFilled16 = "arrow-fat-up-filled-16"
    case arrowFatUpFilled20 = "arrow-fat-up-filled-20"
    case arrowFatUpFilled24 = "arrow-fat-up-filled-24"
    case arrowFatUpFilled32 = "arrow-fat-up-filled-32"
    case arrowLeft12 = "arrow-left-12"
    case arrowLeft16 = "arrow-left-16"
    case arrowLeft20 = "arrow-left-20"
    case arrowLeft24 = "arrow-left-24"
    case arrowLeft32 = "arrow-left-32"
    case arrowRight12 = "arrow-right-12"
    case arrowRight16 = "arrow-right-16"
    case arrowRight20 = "arrow-right-20"
    case arrowRight24 = "arrow-right-24"
    case arrowRight32 = "arrow-right-32"
    case arrowUp12 = "arrow-up-12"
    case arrowUp16 = "arrow-up-16"
    case arrowUp20 = "arrow-up-20"
    case arrowUp24 = "arrow-up-24"
    case arrowUp32 = "arrow-up-32"
    case arrowUpFromBracket12 = "arrow-up-from-bracket-12"
    case arrowUpFromBracket16 = "arrow-up-from-bracket-16"
    case arrowUpFromBracket20 = "arrow-up-from-bracket-20"
    case arrowUpFromBracket24 = "arrow-up-from-bracket-24"
    case arrowUpFromBracket32 = "arrow-up-from-bracket-32"
    case arrowUpLeft12 = "arrow-up-left-12"
    case arrowUpLeft16 = "arrow-up-left-16"
    case arrowUpLeft20 = "arrow-up-left-20"
    case arrowUpLeft24 = "arrow-up-left-24"
    case arrowUpLeft32 = "arrow-up-left-32"
    case arrowUpRight12 = "arrow-up-right-12"
    case arrowUpRight16 = "arrow-up-right-16"
    case arrowUpRight20 = "arrow-up-right-20"
    case arrowUpRight24 = "arrow-up-right-24"
    case arrowUpRight32 = "arrow-up-right-32"
    case arrowUpRightFromBracket12 = "arrow-up-right-from-bracket-12"
    case arrowUpRightFromBracket16 = "arrow-up-right-from-bracket-16"
    case arrowUpRightFromBracket20 = "arrow-up-right-from-bracket-20"
    case arrowUpRightFromBracket24 = "arrow-up-right-from-bracket-24"
    case arrowUpRightFromBracket32 = "arrow-up-right-from-bracket-32"
    case arrowUpRightFromSquare12 = "arrow-up-right-from-square-12"
    case arrowUpRightFromSquare16 = "arrow-up-right-from-square-16"
    case arrowUpRightFromSquare20 = "arrow-up-right-from-square-20"
    case arrowUpRightFromSquare24 = "arrow-up-right-from-square-24"
    case arrowUpRightFromSquare32 = "arrow-up-right-from-square-32"
    case arrowUpRightFromSquareFlush12 = "arrow-up-right-from-square-flush-12"
    case arrowUpRightFromSquareFlush16 = "arrow-up-right-from-square-flush-16"
    case arrowUpRightFromSquareFlush20 = "arrow-up-right-from-square-flush-20"
    case arrowUpRightFromSquareFlush24 = "arrow-up-right-from-square-flush-24"
    case arrowUpRightFromSquareFlush32 = "arrow-up-right-from-square-flush-32"
    case atom12 = "atom-12"
    case atom16 = "atom-16"
    case atom20 = "atom-20"
    case atom24 = "atom-24"
    case atom26 = "atom-26"
    case atom32 = "atom-32"
    case ban12 = "ban-12"
    case ban16 = "ban-16"
    case ban20 = "ban-20"
    case ban24 = "ban-24"
    case ban32 = "ban-32"
    case bank12 = "bank-12"
    case bank16 = "bank-16"
    case bank20 = "bank-20"
    case bank24 = "bank-24"
    case bank32 = "bank-32"
    case bannerPhoto12 = "banner-photo-12"
    case bannerPhoto16 = "banner-photo-16"
    case bannerPhoto20 = "banner-photo-20"
    case bannerPhoto24 = "banner-photo-24"
    case bannerPhoto32 = "banner-photo-32"
    case barChart12 = "bar-chart-12"
    case barChart16 = "bar-chart-16"
    case barChart20 = "bar-chart-20"
    case barChart24 = "bar-chart-24"
    case barChart32 = "bar-chart-32"
    case barsFilter12 = "bars-filter-12"
    case barsFilter16 = "bars-filter-16"
    case barsFilter20 = "bars-filter-20"
    case barsFilter24 = "bars-filter-24"
    case barsFilter32 = "bars-filter-32"
    case beaker12 = "beaker-12"
    case beaker16 = "beaker-16"
    case beaker20 = "beaker-20"
    case beaker24 = "beaker-24"
    case beaker32 = "beaker-32"
    case beakerFilled12 = "beaker-filled-12"
    case beakerFilled16 = "beaker-filled-16"
    case beakerFilled20 = "beaker-filled-20"
    case beakerFilled24 = "beaker-filled-24"
    case beakerFilled32 = "beaker-filled-32"
    case bell12 = "bell-12"
    case bell16 = "bell-16"
    case bell20 = "bell-20"
    case bell24 = "bell-24"
    case bell32 = "bell-32"
    case bellSlash12 = "bell-slash-12"
    case bellSlash16 = "bell-slash-16"
    case bellSlash20 = "bell-slash-20"
    case bellSlash24 = "bell-slash-24"
    case bellSlash32 = "bell-slash-32"
    case bitcoin12 = "bitcoin-12"
    case bitcoin16 = "bitcoin-16"
    case bitcoin20 = "bitcoin-20"
    case bitcoin24 = "bitcoin-24"
    case bitcoin32 = "bitcoin-32"
    case bold12 = "bold-12"
    case bold16 = "bold-16"
    case bold20 = "bold-20"
    case bold24 = "bold-24"
    case bold32 = "bold-32"
    case book12 = "book-12"
    case book16 = "book-16"
    case book20 = "book-20"
    case book24 = "book-24"
    case book32 = "book-32"
    case browser12 = "browser-12"
    case browser16 = "browser-16"
    case browser20 = "browser-20"
    case browser24 = "browser-24"
    case browser32 = "browser-32"
    case bulb12 = "bulb-12"
    case bulb16 = "bulb-16"
    case bulb20 = "bulb-20"
    case bulb24 = "bulb-24"
    case bulb32 = "bulb-32"
    case burger12 = "burger-12"
    case burger16 = "burger-16"
    case burger20 = "burger-20"
    case burger24 = "burger-24"
    case burger32 = "burger-32"
    case calendar12 = "calendar-12"
    case calendar16 = "calendar-16"
    case calendar20 = "calendar-20"
    case calendar24 = "calendar-24"
    case calendar32 = "calendar-32"
    case calendarPlus12 = "calendar-plus-12"
    case calendarPlus16 = "calendar-plus-16"
    case calendarPlus20 = "calendar-plus-20"
    case calendarPlus24 = "calendar-plus-24"
    case calendarPlus32 = "calendar-plus-32"
    case calendarPlusSize12 = "calendar-plus-size-12"
    case calendarPlusSize16 = "calendar-plus-size-16"
    case calendarPlusSize20 = "calendar-plus-size-20"
    case calendarPlusSize24 = "calendar-plus-size-24"
    case calendarPlusSize32 = "calendar-plus-size-32"
    case calendarX12 = "calendar-x-12"
    case calendarX16 = "calendar-x-16"
    case calendarX20 = "calendar-x-20"
    case calendarX24 = "calendar-x-24"
    case calendarX32 = "calendar-x-32"
    case calendarXSize12 = "calendar-x-size-12"
    case calendarXSize16 = "calendar-x-size-16"
    case calendarXSize20 = "calendar-x-size-20"
    case calendarXSize24 = "calendar-x-size-24"
    case calendarXSize32 = "calendar-x-size-32"
    case camera12 = "camera-12"
    case camera16 = "camera-16"
    case camera20 = "camera-20"
    case camera24 = "camera-24"
    case camera32 = "camera-32"
    case cameraAdd12 = "camera-add-12"
    case cameraAdd16 = "camera-add-16"
    case cameraAdd20 = "camera-add-20"
    case cameraAdd24 = "camera-add-24"
    case cameraAdd32 = "camera-add-32"
    case cameraAddFilled12 = "camera-add-filled-12"
    case cameraAddFilled16 = "camera-add-filled-16"
    case cameraAddFilled20 = "camera-add-filled-20"
    case cameraAddFilled24 = "camera-add-filled-24"
    case cameraAddFilled32 = "camera-add-filled-32"
    case cameraFilled12 = "camera-filled-12"
    case cameraFilled16 = "camera-filled-16"
    case cameraFilled20 = "camera-filled-20"
    case cameraFilled24 = "camera-filled-24"
    case cameraFilled32 = "camera-filled-32"
    case cartRemove12 = "cart-remove-12"
    case cartRemove16 = "cart-remove-16"
    case cartRemove20 = "cart-remove-20"
    case cartRemove24 = "cart-remove-24"
    case cartRemove32 = "cart-remove-32"
    case chat12 = "chat-12"
    case chat16 = "chat-16"
    case chat20 = "chat-20"
    case chat24 = "chat-24"
    case chat32 = "chat-32"
    case checklist12 = "checklist-12"
    case checklist16 = "checklist-16"
    case checklist20 = "checklist-20"
    case checklist24 = "checklist-24"
    case checklist32 = "checklist-32"
    case checkmark12 = "checkmark-12"
    case checkmark16 = "checkmark-16"
    case checkmark20 = "checkmark-20"
    case checkmark24 = "checkmark-24"
    case checkmark32 = "checkmark-32"
    case checkmarkCircle12 = "checkmark-circle-12"
    case checkmarkCircle16 = "checkmark-circle-16"
    case checkmarkCircle20 = "checkmark-circle-20"
    case checkmarkCircle24 = "checkmark-circle-24"
    case checkmarkCircle32 = "checkmark-circle-32"
    case checkmarkCircleFilled12 = "checkmark-circle-filled-12"
    case checkmarkCircleFilled16 = "checkmark-circle-filled-16"
    case checkmarkCircleFilled20 = "checkmark-circle-filled-20"
    case checkmarkCircleFilled24 = "checkmark-circle-filled-24"
    case checkmarkCircleFilled32 = "checkmark-circle-filled-32"
    case checkmarkShield12 = "checkmark-shield-12"
    case checkmarkShield16 = "checkmark-shield-16"
    case checkmarkShield20 = "checkmark-shield-20"
    case checkmarkShield24 = "checkmark-shield-24"
    case checkmarkShield32 = "checkmark-shield-32"
    case chevronDown12 = "chevron-down-12"
    case chevronDown16 = "chevron-down-16"
    case chevronDown20 = "chevron-down-20"
    case chevronDown24 = "chevron-down-24"
    case chevronDown32 = "chevron-down-32"
    case chevronDownProperty1DownChevron12 = "chevron-down-property-1-down-chevron-12"
    case chevronDownSize16 = "chevron-down-size-16"
    case chevronDownSize20 = "chevron-down-size-20"
    case chevronDownSize24 = "chevron-down-size-24"
    case chevronDownSize32 = "chevron-down-size-32"
    case chevronLeft12 = "chevron-left-12"
    case chevronLeft16 = "chevron-left-16"
    case chevronLeft20 = "chevron-left-20"
    case chevronLeft24 = "chevron-left-24"
    case chevronLeft32 = "chevron-left-32"
    case chevronLeftProperty1BackChevron12 = "chevron-left-property-1-back-chevron-12"
    case chevronLeftSize16 = "chevron-left-size-16"
    case chevronLeftSize20 = "chevron-left-size-20"
    case chevronLeftSize24 = "chevron-left-size-24"
    case chevronLeftSize32 = "chevron-left-size-32"
    case chevronLeftToLineInBox12 = "chevron-left-to-line-in-box-12"
    case chevronLeftToLineInBox16 = "chevron-left-to-line-in-box-16"
    case chevronLeftToLineInBox20 = "chevron-left-to-line-in-box-20"
    case chevronLeftToLineInBox24 = "chevron-left-to-line-in-box-24"
    case chevronLeftToLineInBox32 = "chevron-left-to-line-in-box-32"
    case chevronLeftToLineInBoxSize12 = "chevron-left-to-line-in-box-size-12"
    case chevronLeftToLineInBoxSize16 = "chevron-left-to-line-in-box-size-16"
    case chevronLeftToLineInBoxSize20 = "chevron-left-to-line-in-box-size-20"
    case chevronLeftToLineInBoxSize24 = "chevron-left-to-line-in-box-size-24"
    case chevronLeftToLineInBoxSize32 = "chevron-left-to-line-in-box-size-32"
    case chevronRight12 = "chevron-right-12"
    case chevronRight16 = "chevron-right-16"
    case chevronRight20 = "chevron-right-20"
    case chevronRight24 = "chevron-right-24"
    case chevronRight32 = "chevron-right-32"
    case chevronRightProperty1ForwardChevron12 = "chevron-right-property-1-forward-chevron-12"
    case chevronRightSize16 = "chevron-right-size-16"
    case chevronRightSize20 = "chevron-right-size-20"
    case chevronRightSize24 = "chevron-right-size-24"
    case chevronRightSize32 = "chevron-right-size-32"
    case chevronUp12 = "chevron-up-12"
    case chevronUp16 = "chevron-up-16"
    case chevronUp20 = "chevron-up-20"
    case chevronUp24 = "chevron-up-24"
    case chevronUp32 = "chevron-up-32"
    case chevronUpProperty1UpChevron12 = "chevron-up-property-1-up-chevron-12"
    case chevronUpSize16 = "chevron-up-size-16"
    case chevronUpSize20 = "chevron-up-size-20"
    case chevronUpSize24 = "chevron-up-size-24"
    case chevronUpSize32 = "chevron-up-size-32"
    case clipboard12 = "clipboard-12"
    case clipboard16 = "clipboard-16"
    case clipboard20 = "clipboard-20"
    case clipboard24 = "clipboard-24"
    case clipboard32 = "clipboard-32"
    case clipboardSize12 = "clipboard-size-12"
    case clipboardSize16 = "clipboard-size-16"
    case clipboardSize20 = "clipboard-size-20"
    case clipboardSize24 = "clipboard-size-24"
    case clipboardSize32 = "clipboard-size-32"
    case clock12 = "clock-12"
    case clock16 = "clock-16"
    case clock20 = "clock-20"
    case clock24 = "clock-24"
    case clock32 = "clock-32"
    case clockFilled12 = "clock-filled-12"
    case clockFilled16 = "clock-filled-16"
    case clockFilled20 = "clock-filled-20"
    case clockFilled24 = "clock-filled-24"
    case clockFilled32 = "clock-filled-32"
    case closedCaptions12 = "closed-captions-12"
    case closedCaptions16 = "closed-captions-16"
    case closedCaptions20 = "closed-captions-20"
    case closedCaptions24 = "closed-captions-24"
    case closedCaptions32 = "closed-captions-32"
    case code12 = "code-12"
    case code16 = "code-16"
    case code20 = "code-20"
    case code24 = "code-24"
    case code32 = "code-32"
    case codeblock12 = "codeblock-12"
    case codeblock16 = "codeblock-16"
    case codeblock20 = "codeblock-20"
    case codeblock24 = "codeblock-24"
    case codeblock32 = "codeblock-32"
    case coinbase12 = "coinbase-12"
    case coinbase16 = "coinbase-16"
    case coinbase20 = "coinbase-20"
    case coinbase24 = "coinbase-24"
    case coinbase32 = "coinbase-32"
    case collapseSidebar12 = "collapse-sidebar-12"
    case collapseSidebar16 = "collapse-sidebar-16"
    case collapseSidebar20 = "collapse-sidebar-20"
    case collapseSidebar24 = "collapse-sidebar-24"
    case collapseSidebar32 = "collapse-sidebar-32"
    case collapseSidebarFilled12 = "collapse-sidebar-filled-12"
    case collapseSidebarFilled16 = "collapse-sidebar-filled-16"
    case collapseSidebarFilled20 = "collapse-sidebar-filled-20"
    case collapseSidebarFilled24 = "collapse-sidebar-filled-24"
    case collapseSidebarFilled32 = "collapse-sidebar-filled-32"
    case command12 = "command-12"
    case command16 = "command-16"
    case command20 = "command-20"
    case command24 = "command-24"
    case command32 = "command-32"
    case compass12 = "compass-12"
    case compass16 = "compass-16"
    case compass20 = "compass-20"
    case compass24 = "compass-24"
    case compass32 = "compass-32"
    case compassFilled12 = "compass-filled-12"
    case compassFilled16 = "compass-filled-16"
    case compassFilled20 = "compass-filled-20"
    case compassFilled24 = "compass-filled-24"
    case compassFilled32 = "compass-filled-32"
    case component1912 = "component-19-12"
    case component1916 = "component-19-16"
    case component1920 = "component-19-20"
    case component1924 = "component-19-24"
    case component1932 = "component-19-32"
    case compress12 = "compress-12"
    case compress16 = "compress-16"
    case compress20 = "compress-20"
    case compress24 = "compress-24"
    case compress32 = "compress-32"
    case converge12 = "converge-12"
    case converge16 = "converge-16"
    case converge20 = "converge-20"
    case converge24 = "converge-24"
    case converge32 = "converge-32"
    case copy12 = "copy-12"
    case copy16 = "copy-16"
    case copy20 = "copy-20"
    case copy24 = "copy-24"
    case copy32 = "copy-32"
    case couponActive12 = "coupon-active-12"
    case couponActive16 = "coupon-active-16"
    case couponActive20 = "coupon-active-20"
    case couponActive24 = "coupon-active-24"
    case couponActive32 = "coupon-active-32"
    case couponExpired12 = "coupon-expired-12"
    case couponExpired16 = "coupon-expired-16"
    case couponExpired20 = "coupon-expired-20"
    case couponExpired24 = "coupon-expired-24"
    case couponExpired32 = "coupon-expired-32"
    case creditCard12 = "credit-card-12"
    case creditCard16 = "credit-card-16"
    case creditCard20 = "credit-card-20"
    case creditCard24 = "credit-card-24"
    case creditCard32 = "credit-card-32"
    case creditCardFilled12 = "credit-card-filled-12"
    case creditCardFilled16 = "credit-card-filled-16"
    case creditCardFilled20 = "credit-card-filled-20"
    case creditCardFilled24 = "credit-card-filled-24"
    case creditCardFilled32 = "credit-card-filled-32"
    case cube12 = "cube-12"
    case cube16 = "cube-16"
    case cube20 = "cube-20"
    case cube24 = "cube-24"
    case cube32 = "cube-32"
    case cubeDisconnected12 = "cube-disconnected-12"
    case cubeDisconnected16 = "cube-disconnected-16"
    case cubeDisconnected20 = "cube-disconnected-20"
    case cubeDisconnected24 = "cube-disconnected-24"
    case cubeDisconnected26 = "cube-disconnected-26"
    case cubeDisconnected32 = "cube-disconnected-32"
    case cubeFilled12 = "cube-filled-12"
    case cubeFilled16 = "cube-filled-16"
    case cubeFilled20 = "cube-filled-20"
    case cubeFilled24 = "cube-filled-24"
    case cubeFilled32 = "cube-filled-32"
    case cubeSize12 = "cube-size-12"
    case cubeSize16 = "cube-size-16"
    case cubeSize20 = "cube-size-20"
    case cubeSize24 = "cube-size-24"
    case cubeSize32 = "cube-size-32"
    case cursor12 = "cursor-12"
    case cursor16 = "cursor-16"
    case cursor20 = "cursor-20"
    case cursor24 = "cursor-24"
    case cursor32 = "cursor-32"
    case cursorFilled12 = "cursor-filled-12"
    case cursorFilled16 = "cursor-filled-16"
    case cursorFilled20 = "cursor-filled-20"
    case cursorFilled24 = "cursor-filled-24"
    case cursorFilled32 = "cursor-filled-32"
    case cursorOutline12 = "cursor-outline-12"
    case cursorOutline16 = "cursor-outline-16"
    case cursorOutline20 = "cursor-outline-20"
    case cursorOutline24 = "cursor-outline-24"
    case cursorOutline32 = "cursor-outline-32"
    case dashboard12 = "dashboard-12"
    case dashboard16 = "dashboard-16"
    case dashboard20 = "dashboard-20"
    case dashboard24 = "dashboard-24"
    case dashboard32 = "dashboard-32"
    case dashedCircle12 = "dashed-circle-12"
    case dashedCircle16 = "dashed-circle-16"
    case dashedCircle20 = "dashed-circle-20"
    case dashedCircle24 = "dashed-circle-24"
    case dashedCircle32 = "dashed-circle-32"
    case dice12 = "dice-12"
    case dice16 = "dice-16"
    case dice20 = "dice-20"
    case dice24 = "dice-24"
    case dice32 = "dice-32"
    case diceSize12 = "dice-size-12"
    case diceSize16 = "dice-size-16"
    case diceSize20 = "dice-size-20"
    case diceSize24 = "dice-size-24"
    case diceSize32 = "dice-size-32"
    case discord12 = "discord-12"
    case discord16 = "discord-16"
    case discord20 = "discord-20"
    case discord24 = "discord-24"
    case discord32 = "discord-32"
    case discordFilled12 = "discord-filled-12"
    case discordFilled16 = "discord-filled-16"
    case discordFilled20 = "discord-filled-20"
    case discordFilled24 = "discord-filled-24"
    case discordFilled32 = "discord-filled-32"
    case discordFilledSize12 = "discord-filled-size-12"
    case discordFilledSize16 = "discord-filled-size-16"
    case discordFilledSize20 = "discord-filled-size-20"
    case discordFilledSize24 = "discord-filled-size-24"
    case discordFilledSize32 = "discord-filled-size-32"
    case discordSize12 = "discord-size-12"
    case discordSize16 = "discord-size-16"
    case discordSize20 = "discord-size-20"
    case discordSize24 = "discord-size-24"
    case discordSize32 = "discord-size-32"
    case dna12 = "dna-12"
    case dna16 = "dna-16"
    case dna20 = "dna-20"
    case dna24 = "dna-24"
    case dna26 = "dna-26"
    case dna32 = "dna-32"
    case document12 = "document-12"
    case document16 = "document-16"
    case document20 = "document-20"
    case document24 = "document-24"
    case document32 = "document-32"
    case documentLines12 = "document-lines-12"
    case documentLines16 = "document-lines-16"
    case documentLines20 = "document-lines-20"
    case documentLines24 = "document-lines-24"
    case documentLines32 = "document-lines-32"
    case documentPlus12 = "document-plus-12"
    case documentPlus16 = "document-plus-16"
    case documentPlus20 = "document-plus-20"
    case documentPlus24 = "document-plus-24"
    case documentPlus32 = "document-plus-32"
    case documentPlusSize4 = "document-plus-size-4"
    case documentPlusSize6 = "document-plus-size-6"
    case dollarCircle12 = "dollar-circle-12"
    case dollarCircle16 = "dollar-circle-16"
    case dollarCircle20 = "dollar-circle-20"
    case dollarCircle24 = "dollar-circle-24"
    case dollarCircle32 = "dollar-circle-32"
    case dollarCircleFilled12 = "dollar-circle-filled-12"
    case dollarCircleFilled16 = "dollar-circle-filled-16"
    case dollarCircleFilled20 = "dollar-circle-filled-20"
    case dollarCircleFilled24 = "dollar-circle-filled-24"
    case dollarCircleFilled32 = "dollar-circle-filled-32"
    case dollarSign12 = "dollar-sign-12"
    case dollarSign16 = "dollar-sign-16"
    case dollarSign20 = "dollar-sign-20"
    case dollarSign24 = "dollar-sign-24"
    case dollarSign32 = "dollar-sign-32"
    case dollarSignSlashed12 = "dollar-sign-slashed-12"
    case dollarSignSlashed16 = "dollar-sign-slashed-16"
    case dollarSignSlashed20 = "dollar-sign-slashed-20"
    case dollarSignSlashed24 = "dollar-sign-slashed-24"
    case dollarSignSlashed32 = "dollar-sign-slashed-32"
    case download12 = "download-12"
    case download16 = "download-16"
    case download20 = "download-20"
    case download24 = "download-24"
    case download32 = "download-32"
    case downloadDocument12 = "download-document-12"
    case downloadDocument16 = "download-document-16"
    case downloadDocument20 = "download-document-20"
    case downloadDocument24 = "download-document-24"
    case downloadDocument32 = "download-document-32"
    case downloadDocumentFilled12 = "download-document-filled-12"
    case downloadDocumentFilled16 = "download-document-filled-16"
    case downloadDocumentFilled20 = "download-document-filled-20"
    case downloadDocumentFilled24 = "download-document-filled-24"
    case downloadDocumentFilled32 = "download-document-filled-32"
    case dragHandleHorizontal12 = "drag-handle-horizontal-12"
    case dragHandleHorizontal16 = "drag-handle-horizontal-16"
    case dragHandleHorizontal20 = "drag-handle-horizontal-20"
    case dragHandleHorizontal24 = "drag-handle-horizontal-24"
    case dragHandleHorizontal32 = "drag-handle-horizontal-32"
    case dragHandleVertical12 = "drag-handle-vertical-12"
    case dragHandleVertical16 = "drag-handle-vertical-16"
    case dragHandleVertical20 = "drag-handle-vertical-20"
    case dragHandleVertical24 = "drag-handle-vertical-24"
    case dragHandleVertical32 = "drag-handle-vertical-32"
    case edit12 = "edit-12"
    case edit16 = "edit-16"
    case edit20 = "edit-20"
    case edit24 = "edit-24"
    case edit32 = "edit-32"
    case editProfile12 = "edit-profile-12"
    case editProfile16 = "edit-profile-16"
    case editProfile20 = "edit-profile-20"
    case editProfile24 = "edit-profile-24"
    case editProfile32 = "edit-profile-32"
    case emailOut12 = "email-out-12"
    case emailOut16 = "email-out-16"
    case emailOut20 = "email-out-20"
    case emailOut24 = "email-out-24"
    case emailOut32 = "email-out-32"
    case errorCircle12 = "error-circle-12"
    case errorCircle16 = "error-circle-16"
    case errorCircle20 = "error-circle-20"
    case errorCircle24 = "error-circle-24"
    case errorCircle32 = "error-circle-32"
    case ethereum12 = "ethereum-12"
    case ethereum16 = "ethereum-16"
    case ethereum20 = "ethereum-20"
    case ethereum24 = "ethereum-24"
    case ethereum32 = "ethereum-32"
    case etherium12 = "etherium-12"
    case etherium16 = "etherium-16"
    case etherium20 = "etherium-20"
    case etherium24 = "etherium-24"
    case etherium32 = "etherium-32"
    case exclamationCircle12 = "exclamation-circle-12"
    case exclamationCircle16 = "exclamation-circle-16"
    case exclamationCircle20 = "exclamation-circle-20"
    case exclamationCircle24 = "exclamation-circle-24"
    case exclamationCircle32 = "exclamation-circle-32"
    case exclamationTriangle12 = "exclamation-triangle-12"
    case exclamationTriangle16 = "exclamation-triangle-16"
    case exclamationTriangle20 = "exclamation-triangle-20"
    case exclamationTriangle24 = "exclamation-triangle-24"
    case exclamationTriangle32 = "exclamation-triangle-32"
    case expand12 = "expand-12"
    case expand16 = "expand-16"
    case expand20 = "expand-20"
    case expand24 = "expand-24"
    case expand32 = "expand-32"
    case export12 = "export-12"
    case export16 = "export-16"
    case export20 = "export-20"
    case export24 = "export-24"
    case export32 = "export-32"
    case eye12 = "eye-12"
    case eye16 = "eye-16"
    case eye20 = "eye-20"
    case eye24 = "eye-24"
    case eye32 = "eye-32"
    case eyeSlashed12 = "eye-slashed-12"
    case eyeSlashed16 = "eye-slashed-16"
    case eyeSlashed20 = "eye-slashed-20"
    case eyeSlashed24 = "eye-slashed-24"
    case eyeSlashed32 = "eye-slashed-32"
    case facebook12 = "facebook-12"
    case facebook16 = "facebook-16"
    case facebook20 = "facebook-20"
    case facebook24 = "facebook-24"
    case facebook32 = "facebook-32"
    case facebookFilled12 = "facebook-filled-12"
    case facebookFilled16 = "facebook-filled-16"
    case facebookFilled20 = "facebook-filled-20"
    case facebookFilled24 = "facebook-filled-24"
    case facebookFilled32 = "facebook-filled-32"
    case facebookFilledSize12 = "facebook-filled-size-12"
    case facebookFilledSize16 = "facebook-filled-size-16"
    case facebookFilledSize20 = "facebook-filled-size-20"
    case facebookFilledSize24 = "facebook-filled-size-24"
    case facebookFilledSize32 = "facebook-filled-size-32"
    case facebookSize12 = "facebook-size-12"
    case facebookSize16 = "facebook-size-16"
    case facebookSize20 = "facebook-size-20"
    case facebookSize24 = "facebook-size-24"
    case facebookSize32 = "facebook-size-32"
    case fileLines12 = "file-lines-12"
    case fileLines16 = "file-lines-16"
    case fileLines20 = "file-lines-20"
    case fileLines24 = "file-lines-24"
    case fileLines32 = "file-lines-32"
    case fileLinesSize12 = "file-lines-size-12"
    case fileLinesSize16 = "file-lines-size-16"
    case fileLinesSize20 = "file-lines-size-20"
    case fileLinesSize24 = "file-lines-size-24"
    case fileLinesSize32 = "file-lines-size-32"
    case filterDown12 = "filter-down-12"
    case filterDown16 = "filter-down-16"
    case filterDown20 = "filter-down-20"
    case filterDown24 = "filter-down-24"
    case filterDown32 = "filter-down-32"
    case flag12 = "flag-12"
    case flag16 = "flag-16"
    case flag20 = "flag-20"
    case flag24 = "flag-24"
    case flag32 = "flag-32"
    case flagFilled12 = "flag-filled-12"
    case flagFilled16 = "flag-filled-16"
    case flagFilled20 = "flag-filled-20"
    case flagFilled24 = "flag-filled-24"
    case flagFilled32 = "flag-filled-32"
    case folderAdd12 = "folder-add-12"
    case folderAdd16 = "folder-add-16"
    case folderAdd20 = "folder-add-20"
    case folderAdd24 = "folder-add-24"
    case folderAdd32 = "folder-add-32"
    case fullScreen12 = "full-screen-12"
    case fullScreen16 = "full-screen-16"
    case fullScreen20 = "full-screen-20"
    case fullScreen24 = "full-screen-24"
    case fullScreen32 = "full-screen-32"
    case gamepad12 = "gamepad-12"
    case gamepad16 = "gamepad-16"
    case gamepad20 = "gamepad-20"
    case gamepad24 = "gamepad-24"
    case gamepad32 = "gamepad-32"
    case gamepadFilled12 = "gamepad-filled-12"
    case gamepadFilled16 = "gamepad-filled-16"
    case gamepadFilled20 = "gamepad-filled-20"
    case gamepadFilled24 = "gamepad-filled-24"
    case gamepadFilled32 = "gamepad-filled-32"
    case gear12 = "gear-12"
    case gear16 = "gear-16"
    case gear20 = "gear-20"
    case gear24 = "gear-24"
    case gear32 = "gear-32"
    case gif12 = "gif-12"
    case gif16 = "gif-16"
    case gif20 = "gif-20"
    case gif24 = "gif-24"
    case gif32 = "gif-32"
    case gifFilled12 = "gif-filled-12"
    case gifFilled16 = "gif-filled-16"
    case gifFilled20 = "gif-filled-20"
    case gifFilled24 = "gif-filled-24"
    case gifFilled32 = "gif-filled-32"
    case gift12 = "gift-12"
    case gift16 = "gift-16"
    case gift20 = "gift-20"
    case gift24 = "gift-24"
    case gift32 = "gift-32"
    case globe12 = "globe-12"
    case globe16 = "globe-16"
    case globe20 = "globe-20"
    case globe24 = "globe-24"
    case globe32 = "globe-32"
    case globeInSquare12 = "globe-in-square-12"
    case globeInSquare16 = "globe-in-square-16"
    case globeInSquare20 = "globe-in-square-20"
    case globeInSquare24 = "globe-in-square-24"
    case globeInSquare32 = "globe-in-square-32"
    case grid12 = "grid-12"
    case grid16 = "grid-16"
    case grid20 = "grid-20"
    case grid24 = "grid-24"
    case grid32 = "grid-32"
    case gridAdd12 = "grid-add-12"
    case gridAdd16 = "grid-add-16"
    case gridAdd20 = "grid-add-20"
    case gridAdd24 = "grid-add-24"
    case gridAdd32 = "grid-add-32"
    case handWave12 = "hand-wave-12"
    case handWave16 = "hand-wave-16"
    case handWave20 = "hand-wave-20"
    case handWave24 = "hand-wave-24"
    case handWave32 = "hand-wave-32"
    case happy12 = "happy-12"
    case happy16 = "happy-16"
    case happy20 = "happy-20"
    case happy24 = "happy-24"
    case happy32 = "happy-32"
    case happyFaceFilled12 = "happy-face-filled-12"
    case happyFaceFilled16 = "happy-face-filled-16"
    case happyFaceFilled20 = "happy-face-filled-20"
    case happyFaceFilled24 = "happy-face-filled-24"
    case happyFaceFilled32 = "happy-face-filled-32"
    case happyFacePlus12 = "happy-face-plus-12"
    case happyFacePlus16 = "happy-face-plus-16"
    case happyFacePlus20 = "happy-face-plus-20"
    case happyFacePlus24 = "happy-face-plus-24"
    case happyFacePlus32 = "happy-face-plus-32"
    case happyFilled12 = "happy-filled-12"
    case happyFilled16 = "happy-filled-16"
    case happyFilled20 = "happy-filled-20"
    case happyFilled24 = "happy-filled-24"
    case happyFilled32 = "happy-filled-32"
    case happyPlus12 = "happy-plus-12"
    case happyPlus16 = "happy-plus-16"
    case happyPlus20 = "happy-plus-20"
    case happyPlus24 = "happy-plus-24"
    case happyPlus32 = "happy-plus-32"
    case hashtag12 = "hashtag-12"
    case hashtag16 = "hashtag-16"
    case hashtag20 = "hashtag-20"
    case hashtag24 = "hashtag-24"
    case hashtag32 = "hashtag-32"
    case hashtagFilled12 = "hashtag-filled-12"
    case hashtagFilled16 = "hashtag-filled-16"
    case hashtagFilled20 = "hashtag-filled-20"
    case hashtagFilled24 = "hashtag-filled-24"
    case hashtagFilled32 = "hashtag-filled-32"
    case heading12 = "heading-12"
    case heading16 = "heading-16"
    case heading20 = "heading-20"
    case heading24 = "heading-24"
    case heading32 = "heading-32"
    case headphones12 = "headphones-12"
    case headphones16 = "headphones-16"
    case headphones20 = "headphones-20"
    case headphones24 = "headphones-24"
    case headphones32 = "headphones-32"
    case heart12 = "heart-12"
    case heart16 = "heart-16"
    case heart20 = "heart-20"
    case heart24 = "heart-24"
    case heart32 = "heart-32"
    case heartFilled12 = "heart-filled-12"
    case heartFilled16 = "heart-filled-16"
    case heartFilled20 = "heart-filled-20"
    case heartFilled24 = "heart-filled-24"
    case heartFilled32 = "heart-filled-32"
    case home12 = "home-12"
    case home16 = "home-16"
    case home20 = "home-20"
    case home24 = "home-24"
    case home32 = "home-32"
    case hourGlass12 = "hour-glass-12"
    case hourGlass16 = "hour-glass-16"
    case hourGlass20 = "hour-glass-20"
    case hourGlass24 = "hour-glass-24"
    case hourGlass32 = "hour-glass-32"
    case illuminati12 = "illuminati-12"
    case illuminati16 = "illuminati-16"
    case illuminati20 = "illuminati-20"
    case illuminati24 = "illuminati-24"
    case illuminati32 = "illuminati-32"
    case illuminatiFilled12 = "illuminati-filled-12"
    case illuminatiFilled16 = "illuminati-filled-16"
    case illuminatiFilled20 = "illuminati-filled-20"
    case illuminatiFilled24 = "illuminati-filled-24"
    case illuminatiFilled32 = "illuminati-filled-32"
    case inbox12 = "inbox-12"
    case inbox16 = "inbox-16"
    case inbox20 = "inbox-20"
    case inbox24 = "inbox-24"
    case inbox32 = "inbox-32"
    case inboxSize6 = "inbox-size-6"
    case info12 = "info-12"
    case info16 = "info-16"
    case info20 = "info-20"
    case info24 = "info-24"
    case info32 = "info-32"
    case infoCircle12 = "info-circle-12"
    case infoCircle16 = "info-circle-16"
    case infoCircle20 = "info-circle-20"
    case infoCircle24 = "info-circle-24"
    case infoCircle32 = "info-circle-32"
    case infoCircleFilled12 = "info-circle-filled-12"
    case infoCircleFilled16 = "info-circle-filled-16"
    case infoCircleFilled20 = "info-circle-filled-20"
    case infoCircleFilled24 = "info-circle-filled-24"
    case infoCircleFilled32 = "info-circle-filled-32"
    case infoFilled12 = "info-filled-12"
    case infoFilled16 = "info-filled-16"
    case infoFilled20 = "info-filled-20"
    case infoFilled24 = "info-filled-24"
    case infoFilled32 = "info-filled-32"
    case infoOutline12 = "info-outline-12"
    case infoOutline16 = "info-outline-16"
    case infoOutline20 = "info-outline-20"
    case infoOutline24 = "info-outline-24"
    case infoOutline32 = "info-outline-32"
    case infoSize12 = "info-size-12"
    case infoSize16 = "info-size-16"
    case infoSize20 = "info-size-20"
    case infoSize24 = "info-size-24"
    case infoSize32 = "info-size-32"
    case infoSquare12 = "info-square-12"
    case infoSquare16 = "info-square-16"
    case infoSquare20 = "info-square-20"
    case infoSquare24 = "info-square-24"
    case infoSquare32 = "info-square-32"
    case information12 = "information-12"
    case information16 = "information-16"
    case information20 = "information-20"
    case information24 = "information-24"
    case information32 = "information-32"
    case instagram12 = "instagram-12"
    case instagram16 = "instagram-16"
    case instagram20 = "instagram-20"
    case instagram24 = "instagram-24"
    case instagram32 = "instagram-32"
    case instagramSize12 = "instagram-size-12"
    case instagramSize16 = "instagram-size-16"
    case instagramSize20 = "instagram-size-20"
    case instagramSize24 = "instagram-size-24"
    case instagramSize32 = "instagram-size-32"
    case italic12 = "italic-12"
    case italic16 = "italic-16"
    case italic20 = "italic-20"
    case italic24 = "italic-24"
    case italic32 = "italic-32"
    case item12 = "item-12"
    case item20 = "item-20"
    case item24 = "item-24"
    case item26 = "item-26"
    case item32 = "item-32"
    case k12 = "k-12"
    case k16 = "k-16"
    case k20 = "k-20"
    case k24 = "k-24"
    case k32 = "k-32"
    case leaf12 = "leaf-12"
    case leaf16 = "leaf-16"
    case leaf20 = "leaf-20"
    case leaf24 = "leaf-24"
    case leaf32 = "leaf-32"
    case leaveReview12 = "leave-review-12"
    case leaveReview16 = "leave-review-16"
    case leaveReview20 = "leave-review-20"
    case leaveReview24 = "leave-review-24"
    case leaveReview32 = "leave-review-32"
    case lightbulb12 = "lightbulb-12"
    case lightbulb16 = "lightbulb-16"
    case lightbulb20 = "lightbulb-20"
    case lightbulb24 = "lightbulb-24"
    case lightbulb32 = "lightbulb-32"
    case lightsOff12 = "lights-off-12"
    case lightsOff16 = "lights-off-16"
    case lightsOff20 = "lights-off-20"
    case lightsOff24 = "lights-off-24"
    case lightsOff32 = "lights-off-32"
    case lightsOn12 = "lights-on-12"
    case lightsOn16 = "lights-on-16"
    case lightsOn20 = "lights-on-20"
    case lightsOn24 = "lights-on-24"
    case lightsOn32 = "lights-on-32"
    case lilstNumber12 = "lilst-number-12"
    case lilstNumber16 = "lilst-number-16"
    case lilstNumber20 = "lilst-number-20"
    case lilstNumber24 = "lilst-number-24"
    case lilstNumber32 = "lilst-number-32"
    case link12 = "link-12"
    case link16 = "link-16"
    case link20 = "link-20"
    case link24 = "link-24"
    case link32 = "link-32"
    case linkAdd12 = "link-add-12"
    case linkAdd16 = "link-add-16"
    case linkAdd20 = "link-add-20"
    case linkAdd24 = "link-add-24"
    case linkAdd32 = "link-add-32"
    case linkSlash12 = "link-slash-12"
    case linkSlash16 = "link-slash-16"
    case linkSlash20 = "link-slash-20"
    case linkSlash24 = "link-slash-24"
    case linkSlash32 = "link-slash-32"
    case linkedin12 = "linkedin-12"
    case linkedin16 = "linkedin-16"
    case linkedin20 = "linkedin-20"
    case linkedin24 = "linkedin-24"
    case linkedin32 = "linkedin-32"
    case list12 = "list-12"
    case list16 = "list-16"
    case list20 = "list-20"
    case list24 = "list-24"
    case list32 = "list-32"
    case listBullet12 = "list-bullet-12"
    case listBullet16 = "list-bullet-16"
    case listBullet20 = "list-bullet-20"
    case listBullet24 = "list-bullet-24"
    case listBullet32 = "list-bullet-32"
    case listCheck12 = "list-check-12"
    case listCheck16 = "list-check-16"
    case listCheck20 = "list-check-20"
    case listCheck24 = "list-check-24"
    case listCheck32 = "list-check-32"
    case listNumber12 = "list-number-12"
    case listNumber16 = "list-number-16"
    case listNumber20 = "list-number-20"
    case listNumber24 = "list-number-24"
    case listNumber32 = "list-number-32"
    case locationPin12 = "location-pin-12"
    case locationPin16 = "location-pin-16"
    case locationPin20 = "location-pin-20"
    case locationPin24 = "location-pin-24"
    case locationPin32 = "location-pin-32"
    case lock12 = "lock-12"
    case lock16 = "lock-16"
    case lock20 = "lock-20"
    case lock24 = "lock-24"
    case lock32 = "lock-32"
    case lockFilled12 = "lock-filled-12"
    case lockFilled16 = "lock-filled-16"
    case lockFilled20 = "lock-filled-20"
    case lockFilled24 = "lock-filled-24"
    case lockFilled32 = "lock-filled-32"
    case lockOpen12 = "lock-open-12"
    case lockOpen16 = "lock-open-16"
    case lockOpen20 = "lock-open-20"
    case lockOpen24 = "lock-open-24"
    case lockOpen32 = "lock-open-32"
    case logout12 = "logout-12"
    case logout16 = "logout-16"
    case logout20 = "logout-20"
    case logout24 = "logout-24"
    case logout32 = "logout-32"
    case magnifyingGlass12 = "magnifying-glass-12"
    case magnifyingGlass16 = "magnifying-glass-16"
    case magnifyingGlass20 = "magnifying-glass-20"
    case magnifyingGlass24 = "magnifying-glass-24"
    case magnifyingGlass32 = "magnifying-glass-32"
    case mail12 = "mail-12"
    case mail16 = "mail-16"
    case mail20 = "mail-20"
    case mail24 = "mail-24"
    case mail32 = "mail-32"
    case mailFilled12 = "mail-filled-12"
    case mailFilled16 = "mail-filled-16"
    case mailFilled20 = "mail-filled-20"
    case mailFilled24 = "mail-filled-24"
    case mailFilled32 = "mail-filled-32"
    case mailOut12 = "mail-out-12"
    case mailOut16 = "mail-out-16"
    case mailOut20 = "mail-out-20"
    case mailOut24 = "mail-out-24"
    case mailOut32 = "mail-out-32"
    case markAsRead12 = "mark-as-read-12"
    case markAsRead16 = "mark-as-read-16"
    case markAsRead20 = "mark-as-read-20"
    case markAsRead24 = "mark-as-read-24"
    case markAsRead32 = "mark-as-read-32"
    case markAsUnread12 = "mark-as-unread-12"
    case markAsUnread16 = "mark-as-unread-16"
    case markAsUnread20 = "mark-as-unread-20"
    case markAsUnread24 = "mark-as-unread-24"
    case markAsUnread32 = "mark-as-unread-32"
    case medalCheck12 = "medal-check-12"
    case medalCheck16 = "medal-check-16"
    case medalCheck20 = "medal-check-20"
    case medalCheck24 = "medal-check-24"
    case medalCheck32 = "medal-check-32"
    case medalCheckSize12 = "medal-check-size-12"
    case medalCheckSize16 = "medal-check-size-16"
    case medalCheckSize20 = "medal-check-size-20"
    case medalCheckSize24 = "medal-check-size-24"
    case medalCheckSize32 = "medal-check-size-32"
    case medalCheckmark12 = "medal-checkmark-12"
    case medalCheckmark16 = "medal-checkmark-16"
    case medalCheckmark20 = "medal-checkmark-20"
    case medalCheckmark24 = "medal-checkmark-24"
    case medalCheckmark32 = "medal-checkmark-32"
    case megaphone12 = "megaphone-12"
    case megaphone16 = "megaphone-16"
    case megaphone20 = "megaphone-20"
    case megaphone24 = "megaphone-24"
    case megaphone32 = "megaphone-32"
    case mentionFilled12 = "mention-filled-12"
    case mentionFilled16 = "mention-filled-16"
    case mentionFilled20 = "mention-filled-20"
    case mentionFilled24 = "mention-filled-24"
    case mentionFilled32 = "mention-filled-32"
    case menu12 = "menu-12"
    case menu16 = "menu-16"
    case menu20 = "menu-20"
    case menu24 = "menu-24"
    case menu32 = "menu-32"
    case merch12 = "merch-12"
    case merch16 = "merch-16"
    case merch20 = "merch-20"
    case merch24 = "merch-24"
    case merch32 = "merch-32"
    case message12 = "message-12"
    case message16 = "message-16"
    case message20 = "message-20"
    case message24 = "message-24"
    case message32 = "message-32"
    case messageEdit12 = "message-edit-12"
    case messageEdit16 = "message-edit-16"
    case messageEdit20 = "message-edit-20"
    case messageEdit24 = "message-edit-24"
    case messageEdit32 = "message-edit-32"
    case messageFilled12 = "message-filled-12"
    case messageFilled16 = "message-filled-16"
    case messageFilled20 = "message-filled-20"
    case messageFilled24 = "message-filled-24"
    case messageFilled32 = "message-filled-32"
    case messageNotification12 = "message-notification-12"
    case messageNotification16 = "message-notification-16"
    case messageNotification20 = "message-notification-20"
    case messageNotification24 = "message-notification-24"
    case messageNotification32 = "message-notification-32"
    case messageSlashed12 = "message-slashed-12"
    case messageSlashed16 = "message-slashed-16"
    case messageSlashed20 = "message-slashed-20"
    case messageSlashed24 = "message-slashed-24"
    case messageSlashed32 = "message-slashed-32"
    case messages12 = "messages-12"
    case messages16 = "messages-16"
    case messages20 = "messages-20"
    case messages24 = "messages-24"
    case messages32 = "messages-32"
    case messagesQuestion12 = "messages-question-12"
    case messagesQuestion16 = "messages-question-16"
    case messagesQuestion20 = "messages-question-20"
    case messagesQuestion24 = "messages-question-24"
    case messagesQuestion32 = "messages-question-32"
    case micOff12 = "mic-off-12"
    case micOff16 = "mic-off-16"
    case micOff20 = "mic-off-20"
    case micOff24 = "mic-off-24"
    case micOff32 = "mic-off-32"
    case micOn12 = "mic-on-12"
    case micOn16 = "mic-on-16"
    case micOn20 = "mic-on-20"
    case micOn24 = "mic-on-24"
    case micOn32 = "mic-on-32"
    case microphone12 = "microphone-12"
    case microphone16 = "microphone-16"
    case microphone20 = "microphone-20"
    case microphone24 = "microphone-24"
    case microphone32 = "microphone-32"
    case microphoneOff12 = "microphone-off-12"
    case microphoneOff16 = "microphone-off-16"
    case microphoneOff20 = "microphone-off-20"
    case microphoneOff24 = "microphone-off-24"
    case microphoneOff32 = "microphone-off-32"
    case minimize12 = "minimize-12"
    case minimize16 = "minimize-16"
    case minimize20 = "minimize-20"
    case minimize24 = "minimize-24"
    case minimize32 = "minimize-32"
    case mobilePhone12 = "mobile-phone-12"
    case mobilePhone16 = "mobile-phone-16"
    case mobilePhone20 = "mobile-phone-20"
    case mobilePhone24 = "mobile-phone-24"
    case mobilePhone32 = "mobile-phone-32"
    case mobilePhoneSize12 = "mobile-phone-size-12"
    case mobilePhoneSize16 = "mobile-phone-size-16"
    case mobilePhoneSize20 = "mobile-phone-size-20"
    case mobilePhoneSize24 = "mobile-phone-size-24"
    case mobilePhoneSize32 = "mobile-phone-size-32"
    case monitor12 = "monitor-12"
    case monitor16 = "monitor-16"
    case monitor20 = "monitor-20"
    case monitor24 = "monitor-24"
    case monitor32 = "monitor-32"
    case monitorSize12 = "monitor-size-12"
    case monitorSize16 = "monitor-size-16"
    case monitorSize20 = "monitor-size-20"
    case monitorSize24 = "monitor-size-24"
    case monitorSize32 = "monitor-size-32"
    case moon12 = "moon-12"
    case moon16 = "moon-16"
    case moon20 = "moon-20"
    case moon24 = "moon-24"
    case moon32 = "moon-32"
    case moonFilled12 = "moon-filled-12"
    case moonFilled16 = "moon-filled-16"
    case moonFilled20 = "moon-filled-20"
    case moonFilled24 = "moon-filled-24"
    case moonFilled32 = "moon-filled-32"
    case moonSize12 = "moon-size-12"
    case moonSize16 = "moon-size-16"
    case moonSize20 = "moon-size-20"
    case moonSize24 = "moon-size-24"
    case moonSize32 = "moon-size-32"
    case notificationBellCrossed12 = "notification-bell-crossed-12"
    case notificationBellCrossed16 = "notification-bell-crossed-16"
    case notificationBellCrossed20 = "notification-bell-crossed-20"
    case notificationBellCrossed24 = "notification-bell-crossed-24"
    case notificationBellCrossed32 = "notification-bell-crossed-32"
    case palette12 = "palette-12"
    case palette16 = "palette-16"
    case palette20 = "palette-20"
    case palette24 = "palette-24"
    case palette32 = "palette-32"
    case paperAirplaneFilled12 = "paper-airplane-filled-12"
    case paperAirplaneFilled16 = "paper-airplane-filled-16"
    case paperAirplaneFilled20 = "paper-airplane-filled-20"
    case paperAirplaneFilled24 = "paper-airplane-filled-24"
    case paperAirplaneFilled32 = "paper-airplane-filled-32"
    case paperAirplaneFilledUp12 = "paper-airplane-filled-up-12"
    case paperAirplaneFilledUp16 = "paper-airplane-filled-up-16"
    case paperAirplaneFilledUp20 = "paper-airplane-filled-up-20"
    case paperAirplaneFilledUp24 = "paper-airplane-filled-up-24"
    case paperAirplaneFilledUp32 = "paper-airplane-filled-up-32"
    case paperAirplaneUpFilled12 = "paper-airplane-up-filled-12"
    case paperAirplaneUpFilled16 = "paper-airplane-up-filled-16"
    case paperAirplaneUpFilled20 = "paper-airplane-up-filled-20"
    case paperAirplaneUpFilled24 = "paper-airplane-up-filled-24"
    case paperAirplaneUpFilled32 = "paper-airplane-up-filled-32"
    case parachute12 = "parachute-12"
    case parachute16 = "parachute-16"
    case parachute20 = "parachute-20"
    case parachute24 = "parachute-24"
    case parachute32 = "parachute-32"
    case participants12 = "participants-12"
    case participants16 = "participants-16"
    case participants20 = "participants-20"
    case participants24 = "participants-24"
    case participants32 = "participants-32"
    case pause12 = "pause-12"
    case pause16 = "pause-16"
    case pause20 = "pause-20"
    case pause24 = "pause-24"
    case pause32 = "pause-32"
    case pauseCircle12 = "pause-circle-12"
    case pauseCircle16 = "pause-circle-16"
    case pauseCircle20 = "pause-circle-20"
    case pauseCircle24 = "pause-circle-24"
    case pauseCircle32 = "pause-circle-32"
    case pauseFilled12 = "pause-filled-12"
    case pauseFilled16 = "pause-filled-16"
    case pauseFilled20 = "pause-filled-20"
    case pauseFilled24 = "pause-filled-24"
    case pauseFilled32 = "pause-filled-32"
    case paypal12 = "paypal-12"
    case paypal16 = "paypal-16"
    case paypal20 = "paypal-20"
    case paypal24 = "paypal-24"
    case paypal32 = "paypal-32"
    case pencil12 = "pencil-12"
    case pencil16 = "pencil-16"
    case pencil20 = "pencil-20"
    case pencil24 = "pencil-24"
    case pencil32 = "pencil-32"
    case people12 = "people-12"
    case people16 = "people-16"
    case people20 = "people-20"
    case people212 = "people-2-12"
    case people216 = "people-2-16"
    case people220 = "people-2-20"
    case people224 = "people-2-24"
    case people232 = "people-2-32"
    case people24 = "people-24"
    case people32 = "people-32"
    case peoplePlus12 = "people-plus-12"
    case peoplePlus16 = "people-plus-16"
    case peoplePlus20 = "people-plus-20"
    case peoplePlus24 = "people-plus-24"
    case peoplePlus32 = "people-plus-32"
    case percentage12 = "percentage-12"
    case percentage16 = "percentage-16"
    case percentage20 = "percentage-20"
    case percentage24 = "percentage-24"
    case percentage32 = "percentage-32"
    case photo12 = "photo-12"
    case photo16 = "photo-16"
    case photo20 = "photo-20"
    case photo24 = "photo-24"
    case photo32 = "photo-32"
    case photoFilled12 = "photo-filled-12"
    case photoFilled16 = "photo-filled-16"
    case photoFilled20 = "photo-filled-20"
    case photoFilled24 = "photo-filled-24"
    case photoFilled32 = "photo-filled-32"
    case photos12 = "photos-12"
    case photos16 = "photos-16"
    case photos20 = "photos-20"
    case photos24 = "photos-24"
    case photos32 = "photos-32"
    case pictureInPicture12 = "picture-in-picture-12"
    case pictureInPicture16 = "picture-in-picture-16"
    case pictureInPicture20 = "picture-in-picture-20"
    case pictureInPicture24 = "picture-in-picture-24"
    case pictureInPicture32 = "picture-in-picture-32"
    case pin12 = "pin-12"
    case pin16 = "pin-16"
    case pin20 = "pin-20"
    case pin24 = "pin-24"
    case pin32 = "pin-32"
    case pinFilled12 = "pin-filled-12"
    case pinFilled16 = "pin-filled-16"
    case pinFilled20 = "pin-filled-20"
    case pinFilled24 = "pin-filled-24"
    case pinFilled32 = "pin-filled-32"
    case pinTilted12 = "pin-tilted-12"
    case pinTilted16 = "pin-tilted-16"
    case pinTilted20 = "pin-tilted-20"
    case pinTilted24 = "pin-tilted-24"
    case pinTilted32 = "pin-tilted-32"
    case pinTiltedFilled12 = "pin-tilted-filled-12"
    case pinTiltedFilled16 = "pin-tilted-filled-16"
    case pinTiltedFilled20 = "pin-tilted-filled-20"
    case pinTiltedFilled24 = "pin-tilted-filled-24"
    case pinTiltedFilled32 = "pin-tilted-filled-32"
    case plane12 = "plane-12"
    case plane16 = "plane-16"
    case plane20 = "plane-20"
    case plane24 = "plane-24"
    case plane32 = "plane-32"
    case play12 = "play-12"
    case play16 = "play-16"
    case play20 = "play-20"
    case play24 = "play-24"
    case play32 = "play-32"
    case playCircle12 = "play-circle-12"
    case playCircle16 = "play-circle-16"
    case playCircle20 = "play-circle-20"
    case playCircle24 = "play-circle-24"
    case playCircle32 = "play-circle-32"
    case playFilled12 = "play-filled-12"
    case playFilled16 = "play-filled-16"
    case playFilled20 = "play-filled-20"
    case playFilled24 = "play-filled-24"
    case playFilled32 = "play-filled-32"
    case plus12 = "plus-12"
    case plus16 = "plus-16"
    case plus20 = "plus-20"
    case plus24 = "plus-24"
    case plus32 = "plus-32"
    case plusCircle12 = "plus-circle-12"
    case plusCircle16 = "plus-circle-16"
    case plusCircle20 = "plus-circle-20"
    case plusCircle24 = "plus-circle-24"
    case plusCircle32 = "plus-circle-32"
    case plusRectangle12 = "plus-rectangle-12"
    case plusRectangle16 = "plus-rectangle-16"
    case plusRectangle20 = "plus-rectangle-20"
    case plusRectangle24 = "plus-rectangle-24"
    case plusRectangle32 = "plus-rectangle-32"
    case profile12 = "profile-12"
    case profile16 = "profile-16"
    case profile20 = "profile-20"
    case profile24 = "profile-24"
    case profile26 = "profile-26"
    case profile32 = "profile-32"
    case profileCircle12 = "profile-circle-12"
    case profileCircle16 = "profile-circle-16"
    case profileCircle20 = "profile-circle-20"
    case profileCircle24 = "profile-circle-24"
    case profileCircle32 = "profile-circle-32"
    case profileFilled12 = "profile-filled-12"
    case profileFilled16 = "profile-filled-16"
    case profileFilled20 = "profile-filled-20"
    case profileFilled24 = "profile-filled-24"
    case profileFilled32 = "profile-filled-32"
    case profileX12 = "profile-x-12"
    case profileX16 = "profile-x-16"
    case profileX20 = "profile-x-20"
    case profileX24 = "profile-x-24"
    case profileX32 = "profile-x-32"
    case questionCircle12 = "question-circle-12"
    case questionCircle16 = "question-circle-16"
    case questionCircle20 = "question-circle-20"
    case questionCircle24 = "question-circle-24"
    case questionCircle32 = "question-circle-32"
    case quoteLeft12 = "quote-left-12"
    case quoteLeft16 = "quote-left-16"
    case quoteLeft20 = "quote-left-20"
    case quoteLeft24 = "quote-left-24"
    case quoteLeft32 = "quote-left-32"
    case quoteRight12 = "quote-right-12"
    case quoteRight16 = "quote-right-16"
    case quoteRight20 = "quote-right-20"
    case quoteRight24 = "quote-right-24"
    case quoteRight32 = "quote-right-32"
    case raiseHand12 = "raise-hand-12"
    case raiseHand16 = "raise-hand-16"
    case raiseHand20 = "raise-hand-20"
    case raiseHand24 = "raise-hand-24"
    case raiseHand32 = "raise-hand-32"
    case receipt12 = "receipt-12"
    case receipt16 = "receipt-16"
    case receipt20 = "receipt-20"
    case receipt24 = "receipt-24"
    case receipt32 = "receipt-32"
    case receptionBell12 = "reception-bell-12"
    case receptionBell16 = "reception-bell-16"
    case receptionBell20 = "reception-bell-20"
    case receptionBell24 = "reception-bell-24"
    case receptionBell32 = "reception-bell-32"
    case receptionBellFilled12 = "reception-bell-filled-12"
    case receptionBellFilled16 = "reception-bell-filled-16"
    case receptionBellFilled20 = "reception-bell-filled-20"
    case receptionBellFilled24 = "reception-bell-filled-24"
    case receptionBellFilled32 = "reception-bell-filled-32"
    case rectangleStack12 = "rectangle-stack-12"
    case rectangleStack16 = "rectangle-stack-16"
    case rectangleStack20 = "rectangle-stack-20"
    case rectangleStack24 = "rectangle-stack-24"
    case rectangleStack32 = "rectangle-stack-32"
    case refresh12 = "refresh-12"
    case refresh16 = "refresh-16"
    case refresh20 = "refresh-20"
    case refresh24 = "refresh-24"
    case refresh32 = "refresh-32"
    case refund12 = "refund-12"
    case refund16 = "refund-16"
    case refund20 = "refund-20"
    case refund24 = "refund-24"
    case refund32 = "refund-32"
    case reply12 = "reply-12"
    case reply16 = "reply-16"
    case reply20 = "reply-20"
    case reply24 = "reply-24"
    case reply32 = "reply-32"
    case replyFilled12 = "reply-filled-12"
    case replyFilled16 = "reply-filled-16"
    case replyFilled20 = "reply-filled-20"
    case replyFilled24 = "reply-filled-24"
    case replyFilled32 = "reply-filled-32"
    case rewardDiamond12 = "reward-diamond-12"
    case rewardDiamond16 = "reward-diamond-16"
    case rewardDiamond20 = "reward-diamond-20"
    case rewardDiamond24 = "reward-diamond-24"
    case rewardDiamond32 = "reward-diamond-32"
    case rocket12 = "rocket-12"
    case rocket16 = "rocket-16"
    case rocket20 = "rocket-20"
    case rocket24 = "rocket-24"
    case rocket32 = "rocket-32"
    case rotate12 = "rotate-12"
    case rotate16 = "rotate-16"
    case rotate20 = "rotate-20"
    case rotate24 = "rotate-24"
    case rotate32 = "rotate-32"
    case rotateCard12 = "rotate-card-12"
    case rotateCard16 = "rotate-card-16"
    case rotateCard20 = "rotate-card-20"
    case rotateCard24 = "rotate-card-24"
    case rotateCard32 = "rotate-card-32"
    case rotateLeft12 = "rotate-left-12"
    case rotateLeft16 = "rotate-left-16"
    case rotateLeft20 = "rotate-left-20"
    case rotateLeft24 = "rotate-left-24"
    case rotateLeft32 = "rotate-left-32"
    case rotateLeftSize12 = "rotate-left-size-12"
    case rotateLeftSize16 = "rotate-left-size-16"
    case rotateLeftSize20 = "rotate-left-size-20"
    case rotateLeftSize24 = "rotate-left-size-24"
    case rotateLeftSize32 = "rotate-left-size-32"
    case rotateRight12 = "rotate-right-12"
    case rotateRight16 = "rotate-right-16"
    case rotateRight20 = "rotate-right-20"
    case rotateRight24 = "rotate-right-24"
    case rotateRight32 = "rotate-right-32"
    case rotateRightSize12 = "rotate-right-size-12"
    case rotateRightSize16 = "rotate-right-size-16"
    case rotateRightSize20 = "rotate-right-size-20"
    case rotateRightSize24 = "rotate-right-size-24"
    case rotateRightSize32 = "rotate-right-size-32"
    case roundedArrowAngleLeft12 = "rounded-arrow-angle-left-12"
    case roundedArrowAngleLeft16 = "rounded-arrow-angle-left-16"
    case roundedArrowAngleLeft20 = "rounded-arrow-angle-left-20"
    case roundedArrowAngleLeft24 = "rounded-arrow-angle-left-24"
    case roundedArrowAngleLeft32 = "rounded-arrow-angle-left-32"
    case roundedArrowAngleRight12 = "rounded-arrow-angle-right-12"
    case roundedArrowAngleRight16 = "rounded-arrow-angle-right-16"
    case roundedArrowAngleRight20 = "rounded-arrow-angle-right-20"
    case roundedArrowAngleRight24 = "rounded-arrow-angle-right-24"
    case roundedArrowAngleRight32 = "rounded-arrow-angle-right-32"
    case sad12 = "sad-12"
    case sad16 = "sad-16"
    case sad20 = "sad-20"
    case sad24 = "sad-24"
    case sad32 = "sad-32"
    case sadFace12 = "sad-face-12"
    case sadFace16 = "sad-face-16"
    case sadFace20 = "sad-face-20"
    case sadFace24 = "sad-face-24"
    case sadFace32 = "sad-face-32"
    case sadFaceFilled12 = "sad-face-filled-12"
    case sadFaceFilled16 = "sad-face-filled-16"
    case sadFaceFilled20 = "sad-face-filled-20"
    case sadFaceFilled24 = "sad-face-filled-24"
    case sadFaceFilled32 = "sad-face-filled-32"
    case sadFilled12 = "sad-filled-12"
    case sadFilled16 = "sad-filled-16"
    case sadFilled20 = "sad-filled-20"
    case sadFilled24 = "sad-filled-24"
    case sadFilled32 = "sad-filled-32"
    case sealCheckmark12 = "seal-checkmark-12"
    case sealCheckmark16 = "seal-checkmark-16"
    case sealCheckmark20 = "seal-checkmark-20"
    case sealCheckmark24 = "seal-checkmark-24"
    case sealCheckmark32 = "seal-checkmark-32"
    case sealCheckmarkFilled12 = "seal-checkmark-filled-12"
    case sealCheckmarkFilled16 = "seal-checkmark-filled-16"
    case sealCheckmarkFilled20 = "seal-checkmark-filled-20"
    case sealCheckmarkFilled24 = "seal-checkmark-filled-24"
    case sealCheckmarkFilled32 = "seal-checkmark-filled-32"
    case sealExclamation12 = "seal-exclamation-12"
    case sealExclamation16 = "seal-exclamation-16"
    case sealExclamation20 = "seal-exclamation-20"
    case sealExclamation24 = "seal-exclamation-24"
    case sealExclamation32 = "seal-exclamation-32"
    case sealExclamationFilled12 = "seal-exclamation-filled-12"
    case sealExclamationFilled16 = "seal-exclamation-filled-16"
    case sealExclamationFilled20 = "seal-exclamation-filled-20"
    case sealExclamationFilled24 = "seal-exclamation-filled-24"
    case sealExclamationFilled32 = "seal-exclamation-filled-32"
    case shareNodes12 = "share-nodes-12"
    case shareNodes16 = "share-nodes-16"
    case shareNodes20 = "share-nodes-20"
    case shareNodes24 = "share-nodes-24"
    case shareNodes32 = "share-nodes-32"
    case shareScreen12 = "share-screen-12"
    case shareScreen16 = "share-screen-16"
    case shareScreen20 = "share-screen-20"
    case shareScreen24 = "share-screen-24"
    case shareScreen32 = "share-screen-32"
    case shieldCheckmark12 = "shield-checkmark-12"
    case shieldCheckmark16 = "shield-checkmark-16"
    case shieldCheckmark20 = "shield-checkmark-20"
    case shieldCheckmark24 = "shield-checkmark-24"
    case shieldCheckmark32 = "shield-checkmark-32"
    case shieldHalf12 = "shield-half-12"
    case shieldHalf16 = "shield-half-16"
    case shieldHalf20 = "shield-half-20"
    case shieldHalf24 = "shield-half-24"
    case shieldHalf32 = "shield-half-32"
    case shop12 = "shop-12"
    case shop16 = "shop-16"
    case shop20 = "shop-20"
    case shop24 = "shop-24"
    case shop32 = "shop-32"
    case shoppingBag12 = "shopping-bag-12"
    case shoppingBag16 = "shopping-bag-16"
    case shoppingBag20 = "shopping-bag-20"
    case shoppingBag24 = "shopping-bag-24"
    case shoppingBag32 = "shopping-bag-32"
    case sparkle12 = "sparkle-12"
    case sparkle16 = "sparkle-16"
    case sparkle20 = "sparkle-20"
    case sparkle24 = "sparkle-24"
    case sparkle32 = "sparkle-32"
    case sparkleFilled12 = "sparkle-filled-12"
    case sparkleFilled16 = "sparkle-filled-16"
    case sparkleFilled20 = "sparkle-filled-20"
    case sparkleFilled24 = "sparkle-filled-24"
    case sparkleFilled32 = "sparkle-filled-32"
    case sparkleMultiple12 = "sparkle-multiple-12"
    case sparkleMultiple16 = "sparkle-multiple-16"
    case sparkleMultiple20 = "sparkle-multiple-20"
    case sparkleMultiple24 = "sparkle-multiple-24"
    case sparkleMultiple32 = "sparkle-multiple-32"
    case sparkleRectangle12 = "sparkle-rectangle-12"
    case sparkleRectangle16 = "sparkle-rectangle-16"
    case sparkleRectangle20 = "sparkle-rectangle-20"
    case sparkleRectangle24 = "sparkle-rectangle-24"
    case sparkleRectangle32 = "sparkle-rectangle-32"
    case sparkles12 = "sparkles-12"
    case sparkles16 = "sparkles-16"
    case sparkles20 = "sparkles-20"
    case sparkles24 = "sparkles-24"
    case sparkles32 = "sparkles-32"
    case speaker12 = "speaker-12"
    case speaker16 = "speaker-16"
    case speaker20 = "speaker-20"
    case speaker24 = "speaker-24"
    case speaker32 = "speaker-32"
    case split12 = "split-12"
    case split16 = "split-16"
    case split20 = "split-20"
    case split24 = "split-24"
    case split32 = "split-32"
    case squareAdd12 = "square-add-12"
    case squareAdd16 = "square-add-16"
    case squareAdd20 = "square-add-20"
    case squareAdd24 = "square-add-24"
    case squareAdd32 = "square-add-32"
    case star12 = "star-12"
    case star16 = "star-16"
    case star20 = "star-20"
    case star24 = "star-24"
    case star32 = "star-32"
    case starFilled12 = "star-filled-12"
    case starFilled16 = "star-filled-16"
    case starFilled20 = "star-filled-20"
    case starFilled24 = "star-filled-24"
    case starFilled32 = "star-filled-32"
    case starHalf12 = "star-half-12"
    case starHalf16 = "star-half-16"
    case starHalf20 = "star-half-20"
    case starHalf24 = "star-half-24"
    case starHalf32 = "star-half-32"
    case stats12 = "stats-12"
    case stats16 = "stats-16"
    case stats20 = "stats-20"
    case stats24 = "stats-24"
    case stats26 = "stats-26"
    case stats32 = "stats-32"
    case sticker12 = "sticker-12"
    case sticker16 = "sticker-16"
    case sticker20 = "sticker-20"
    case sticker24 = "sticker-24"
    case sticker32 = "sticker-32"
    case stickerFilled12 = "sticker-filled-12"
    case stickerFilled16 = "sticker-filled-16"
    case stickerFilled20 = "sticker-filled-20"
    case stickerFilled24 = "sticker-filled-24"
    case stickerFilled32 = "sticker-filled-32"
    case store16 = "store-16"
    case store20 = "store-20"
    case storefrontItem12 = "storefront-item-12"
    case storefrontItem16 = "storefront-item-16"
    case storefrontItem20 = "storefront-item-20"
    case storefrontItem24 = "storefront-item-24"
    case storefrontItem32 = "storefront-item-32"
    case strikethrough12 = "strikethrough-12"
    case strikethrough16 = "strikethrough-16"
    case strikethrough20 = "strikethrough-20"
    case strikethrough24 = "strikethrough-24"
    case strikethrough32 = "strikethrough-32"
    case subtract12 = "subtract-12"
    case subtract16 = "subtract-16"
    case subtract20 = "subtract-20"
    case subtract24 = "subtract-24"
    case subtract32 = "subtract-32"
    case sun12 = "sun-12"
    case sun16 = "sun-16"
    case sun20 = "sun-20"
    case sun24 = "sun-24"
    case sun32 = "sun-32"
    case sunSize12 = "sun-size-12"
    case sunSize16 = "sun-size-16"
    case sunSize20 = "sun-size-20"
    case sunSize24 = "sun-size-24"
    case sunSize32 = "sun-size-32"
    case swords12 = "swords-12"
    case swords16 = "swords-16"
    case swords20 = "swords-20"
    case swords24 = "swords-24"
    case swords32 = "swords-32"
    case tShirt12 = "t-shirt-12"
    case tShirt16 = "t-shirt-16"
    case tShirt20 = "t-shirt-20"
    case tShirt24 = "t-shirt-24"
    case tShirt32 = "t-shirt-32"
    case tShirtFilled12 = "t-shirt-filled-12"
    case tShirtFilled16 = "t-shirt-filled-16"
    case tShirtFilled20 = "t-shirt-filled-20"
    case tShirtFilled24 = "t-shirt-filled-24"
    case tShirtFilled32 = "t-shirt-filled-32"
    case table12 = "table-12"
    case table16 = "table-16"
    case table20 = "table-20"
    case table24 = "table-24"
    case table32 = "table-32"
    case tableSize6 = "table-size-6"
    case tag12 = "tag-12"
    case tag16 = "tag-16"
    case tag20 = "tag-20"
    case tag24 = "tag-24"
    case tag32 = "tag-32"
    case telegram12 = "telegram-12"
    case telegram16 = "telegram-16"
    case telegram20 = "telegram-20"
    case telegram24 = "telegram-24"
    case telegram32 = "telegram-32"
    case telegramFilled12 = "telegram-filled-12"
    case telegramFilled16 = "telegram-filled-16"
    case telegramFilled20 = "telegram-filled-20"
    case telegramFilled24 = "telegram-filled-24"
    case telegramFilled32 = "telegram-filled-32"
    case telegramFilledSize12 = "telegram-filled-size-12"
    case telegramFilledSize16 = "telegram-filled-size-16"
    case telegramFilledSize20 = "telegram-filled-size-20"
    case telegramFilledSize24 = "telegram-filled-size-24"
    case telegramFilledSize32 = "telegram-filled-size-32"
    case telegramSize12 = "telegram-size-12"
    case telegramSize16 = "telegram-size-16"
    case telegramSize20 = "telegram-size-20"
    case telegramSize24 = "telegram-size-24"
    case telegramSize32 = "telegram-size-32"
    case telephone12 = "telephone-12"
    case telephone16 = "telephone-16"
    case telephone20 = "telephone-20"
    case telephone24 = "telephone-24"
    case telephone32 = "telephone-32"
    case threeDotsCircle12 = "three-dots-circle-12"
    case threeDotsCircle16 = "three-dots-circle-16"
    case threeDotsCircle20 = "three-dots-circle-20"
    case threeDotsCircle24 = "three-dots-circle-24"
    case threeDotsCircle32 = "three-dots-circle-32"
    case threeDotsCircleSize12 = "three-dots-circle-size-12"
    case threeDotsCircleSize16 = "three-dots-circle-size-16"
    case threeDotsCircleSize20 = "three-dots-circle-size-20"
    case threeDotsCircleSize24 = "three-dots-circle-size-24"
    case threeDotsCircleSize32 = "three-dots-circle-size-32"
    case threeDotsHorizontal12 = "three-dots-horizontal-12"
    case threeDotsHorizontal16 = "three-dots-horizontal-16"
    case threeDotsHorizontal20 = "three-dots-horizontal-20"
    case threeDotsHorizontal24 = "three-dots-horizontal-24"
    case threeDotsHorizontal32 = "three-dots-horizontal-32"
    case threeDotsVertical12 = "three-dots-vertical-12"
    case threeDotsVertical16 = "three-dots-vertical-16"
    case threeDotsVertical20 = "three-dots-vertical-20"
    case threeDotsVertical24 = "three-dots-vertical-24"
    case threeDotsVertical32 = "three-dots-vertical-32"
    case thumbDown12 = "thumb-down-12"
    case thumbDown16 = "thumb-down-16"
    case thumbDown20 = "thumb-down-20"
    case thumbDown24 = "thumb-down-24"
    case thumbDown32 = "thumb-down-32"
    case thumbDownFilled12 = "thumb-down-filled-12"
    case thumbDownFilled16 = "thumb-down-filled-16"
    case thumbDownFilled20 = "thumb-down-filled-20"
    case thumbDownFilled24 = "thumb-down-filled-24"
    case thumbDownFilled32 = "thumb-down-filled-32"
    case thumbUp12 = "thumb-up-12"
    case thumbUp16 = "thumb-up-16"
    case thumbUp20 = "thumb-up-20"
    case thumbUp24 = "thumb-up-24"
    case thumbUp32 = "thumb-up-32"
    case thumbUpFilled12 = "thumb-up-filled-12"
    case thumbUpFilled16 = "thumb-up-filled-16"
    case thumbUpFilled20 = "thumb-up-filled-20"
    case thumbUpFilled24 = "thumb-up-filled-24"
    case thumbUpFilled32 = "thumb-up-filled-32"
    case tikTok12 = "tik-tok-12"
    case tikTok16 = "tik-tok-16"
    case tikTok20 = "tik-tok-20"
    case tikTok24 = "tik-tok-24"
    case tikTok32 = "tik-tok-32"
    case tikTokFilled12 = "tik-tok-filled-12"
    case tikTokFilled16 = "tik-tok-filled-16"
    case tikTokFilled20 = "tik-tok-filled-20"
    case tikTokFilled24 = "tik-tok-filled-24"
    case tikTokFilled32 = "tik-tok-filled-32"
    case tiktok12 = "tiktok-12"
    case tiktok16 = "tiktok-16"
    case tiktok20 = "tiktok-20"
    case tiktok24 = "tiktok-24"
    case tiktok32 = "tiktok-32"
    case tiktokFilled12 = "tiktok-filled-12"
    case tiktokFilled16 = "tiktok-filled-16"
    case tiktokFilled20 = "tiktok-filled-20"
    case tiktokFilled24 = "tiktok-filled-24"
    case tiktokFilled32 = "tiktok-filled-32"
    case tiktokFilledSize12 = "tiktok-filled-size-12"
    case tiktokFilledSize16 = "tiktok-filled-size-16"
    case tiktokFilledSize20 = "tiktok-filled-size-20"
    case tiktokFilledSize24 = "tiktok-filled-size-24"
    case tiktokFilledSize32 = "tiktok-filled-size-32"
    case tiktokSize12 = "tiktok-size-12"
    case tiktokSize16 = "tiktok-size-16"
    case tiktokSize20 = "tiktok-size-20"
    case tiktokSize24 = "tiktok-size-24"
    case tiktokSize32 = "tiktok-size-32"
    case timeSkipLeft12 = "time-skip-left-12"
    case timeSkipLeft16 = "time-skip-left-16"
    case timeSkipLeft20 = "time-skip-left-20"
    case timeSkipLeft24 = "time-skip-left-24"
    case timeSkipLeft32 = "time-skip-left-32"
    case timeSkipRight12 = "time-skip-right-12"
    case timeSkipRight16 = "time-skip-right-16"
    case timeSkipRight20 = "time-skip-right-20"
    case timeSkipRight24 = "time-skip-right-24"
    case timeSkipRight32 = "time-skip-right-32"
    case tradingView12 = "trading-view-12"
    case tradingView16 = "trading-view-16"
    case tradingView20 = "trading-view-20"
    case tradingView24 = "trading-view-24"
    case tradingView32 = "trading-view-32"
    case tradingview12 = "tradingview-12"
    case tradingview16 = "tradingview-16"
    case tradingview20 = "tradingview-20"
    case tradingview24 = "tradingview-24"
    case tradingview32 = "tradingview-32"
    case trash12 = "trash-12"
    case trash16 = "trash-16"
    case trash20 = "trash-20"
    case trash24 = "trash-24"
    case trash32 = "trash-32"
    case trashFilled12 = "trash-filled-12"
    case trashFilled16 = "trash-filled-16"
    case trashFilled20 = "trash-filled-20"
    case trashFilled24 = "trash-filled-24"
    case trashFilled32 = "trash-filled-32"
    case trashSolid12 = "trash-solid-12"
    case trashSolid16 = "trash-solid-16"
    case trashSolid20 = "trash-solid-20"
    case trashSolid24 = "trash-solid-24"
    case trashSolid32 = "trash-solid-32"
    case trophy12 = "trophy-12"
    case trophy16 = "trophy-16"
    case trophy20 = "trophy-20"
    case trophy24 = "trophy-24"
    case trophy32 = "trophy-32"
    case truck12 = "truck-12"
    case truck16 = "truck-16"
    case truck20 = "truck-20"
    case truck24 = "truck-24"
    case truck32 = "truck-32"
    case twitch12 = "twitch-12"
    case twitch16 = "twitch-16"
    case twitch20 = "twitch-20"
    case twitch24 = "twitch-24"
    case twitch32 = "twitch-32"
    case twitter12 = "twitter-12"
    case twitter16 = "twitter-16"
    case twitter20 = "twitter-20"
    case twitter24 = "twitter-24"
    case twitter32 = "twitter-32"
    case twitterFilled12 = "twitter-filled-12"
    case twitterFilled16 = "twitter-filled-16"
    case twitterFilled20 = "twitter-filled-20"
    case twitterFilled24 = "twitter-filled-24"
    case twitterFilled32 = "twitter-filled-32"
    case twitterFilledSize12 = "twitter-filled-size-12"
    case twitterFilledSize16 = "twitter-filled-size-16"
    case twitterFilledSize20 = "twitter-filled-size-20"
    case twitterFilledSize24 = "twitter-filled-size-24"
    case twitterFilledSize32 = "twitter-filled-size-32"
    case twitterSize12 = "twitter-size-12"
    case twitterSize16 = "twitter-size-16"
    case twitterSize20 = "twitter-size-20"
    case twitterSize24 = "twitter-size-24"
    case twitterSize32 = "twitter-size-32"
    case typography12 = "typography-12"
    case typography16 = "typography-16"
    case typography20 = "typography-20"
    case typography24 = "typography-24"
    case typography32 = "typography-32"
    case underline12 = "underline-12"
    case underline16 = "underline-16"
    case underline20 = "underline-20"
    case underline24 = "underline-24"
    case underline32 = "underline-32"
    case unpin12 = "unpin-12"
    case unpin16 = "unpin-16"
    case unpin20 = "unpin-20"
    case unpin24 = "unpin-24"
    case unpin32 = "unpin-32"
    case unpinFilled12 = "unpin-filled-12"
    case unpinFilled16 = "unpin-filled-16"
    case unpinFilled20 = "unpin-filled-20"
    case unpinFilled24 = "unpin-filled-24"
    case unpinFilled32 = "unpin-filled-32"
    case upinTilted12 = "upin-tilted-12"
    case upinTilted16 = "upin-tilted-16"
    case upinTilted20 = "upin-tilted-20"
    case upinTilted24 = "upin-tilted-24"
    case upinTilted32 = "upin-tilted-32"
    case upinTiltedFilled12 = "upin-tilted-filled-12"
    case upinTiltedFilled16 = "upin-tilted-filled-16"
    case upinTiltedFilled20 = "upin-tilted-filled-20"
    case upinTiltedFilled24 = "upin-tilted-filled-24"
    case upinTiltedFilled32 = "upin-tilted-filled-32"
    case upload12 = "upload-12"
    case upload16 = "upload-16"
    case upload20 = "upload-20"
    case upload24 = "upload-24"
    case upload32 = "upload-32"
    case usd12 = "usd-12"
    case usd16 = "usd-16"
    case usd20 = "usd-20"
    case usd24 = "usd-24"
    case usd32 = "usd-32"
    case user12 = "user-12"
    case user16 = "user-16"
    case user20 = "user-20"
    case user24 = "user-24"
    case user32 = "user-32"
    case verifiedCheck12 = "verified-check-12"
    case verifiedCheck16 = "verified-check-16"
    case verifiedCheck20 = "verified-check-20"
    case verifiedCheck24 = "verified-check-24"
    case verifiedCheck32 = "verified-check-32"
    case videoFilled12 = "video-filled-12"
    case videoFilled16 = "video-filled-16"
    case videoFilled20 = "video-filled-20"
    case videoFilled24 = "video-filled-24"
    case videoFilled32 = "video-filled-32"
    case volumeHigh12 = "volume-high-12"
    case volumeHigh16 = "volume-high-16"
    case volumeHigh20 = "volume-high-20"
    case volumeHigh24 = "volume-high-24"
    case volumeHigh32 = "volume-high-32"
    case volumeLow12 = "volume-low-12"
    case volumeLow16 = "volume-low-16"
    case volumeLow20 = "volume-low-20"
    case volumeLow24 = "volume-low-24"
    case volumeLow32 = "volume-low-32"
    case volumeOff12 = "volume-off-12"
    case volumeOff16 = "volume-off-16"
    case volumeOff20 = "volume-off-20"
    case volumeOff24 = "volume-off-24"
    case volumeOff32 = "volume-off-32"
    case wallet12 = "wallet-12"
    case wallet16 = "wallet-16"
    case wallet20 = "wallet-20"
    case wallet24 = "wallet-24"
    case wallet32 = "wallet-32"
    case waveform12 = "waveform-12"
    case waveform16 = "waveform-16"
    case waveform20 = "waveform-20"
    case waveform24 = "waveform-24"
    case waveform32 = "waveform-32"
    case webcamOff12 = "webcam-off-12"
    case webcamOff16 = "webcam-off-16"
    case webcamOff20 = "webcam-off-20"
    case webcamOff24 = "webcam-off-24"
    case webcamOff32 = "webcam-off-32"
    case webcamOn12 = "webcam-on-12"
    case webcamOn16 = "webcam-on-16"
    case webcamOn20 = "webcam-on-20"
    case webcamOn24 = "webcam-on-24"
    case webcamOn32 = "webcam-on-32"
    case whopLogo12 = "whop-logo-12"
    case whopLogo16 = "whop-logo-16"
    case whopLogo20 = "whop-logo-20"
    case whopLogo24 = "whop-logo-24"
    case whopLogo32 = "whop-logo-32"
    case whopLogoSize5 = "whop-logo-size-5"
    case xCircle12 = "x-circle-12"
    case xCircle16 = "x-circle-16"
    case xCircle20 = "x-circle-20"
    case xCircle24 = "x-circle-24"
    case xCircle32 = "x-circle-32"
    case xCircleFilled12 = "x-circle-filled-12"
    case xCircleFilled16 = "x-circle-filled-16"
    case xCircleFilled20 = "x-circle-filled-20"
    case xCircleFilled24 = "x-circle-filled-24"
    case xCircleFilled32 = "x-circle-filled-32"
    case xCircleSize12 = "x-circle-size-12"
    case xCircleSize16 = "x-circle-size-16"
    case xCircleSize20 = "x-circle-size-20"
    case xCircleSize24 = "x-circle-size-24"
    case xCircleSize32 = "x-circle-size-32"
    case xDotCom12 = "x-dot-com-12"
    case xDotCom16 = "x-dot-com-16"
    case xDotCom20 = "x-dot-com-20"
    case xDotCom24 = "x-dot-com-24"
    case xDotCom32 = "x-dot-com-32"
    case xDotComSize12 = "x-dot-com-size-12"
    case xDotComSize16 = "x-dot-com-size-16"
    case xDotComSize20 = "x-dot-com-size-20"
    case xDotComSize24 = "x-dot-com-size-24"
    case xDotComSize32 = "x-dot-com-size-32"
    case xMark12 = "x-mark-12"
    case xMark16 = "x-mark-16"
    case xMark20 = "x-mark-20"
    case xMark24 = "x-mark-24"
    case xMark32 = "x-mark-32"
    case youTube12 = "you-tube-12"
    case youTube16 = "you-tube-16"
    case youTube20 = "you-tube-20"
    case youTube24 = "you-tube-24"
    case youTube32 = "you-tube-32"
    case youTubeFilled12 = "you-tube-filled-12"
    case youTubeFilled16 = "you-tube-filled-16"
    case youTubeFilled20 = "you-tube-filled-20"
    case youTubeFilled24 = "you-tube-filled-24"
    case youTubeFilled32 = "you-tube-filled-32"
    case youtube12 = "youtube-12"
    case youtube16 = "youtube-16"
    case youtube20 = "youtube-20"
    case youtube24 = "youtube-24"
    case youtube32 = "youtube-32"
    case youtubeFilled12 = "youtube-filled-12"
    case youtubeFilled16 = "youtube-filled-16"
    case youtubeFilled20 = "youtube-filled-20"
    case youtubeFilled24 = "youtube-filled-24"
    case youtubeFilled32 = "youtube-filled-32"
    case youtubeFilledSize12 = "youtube-filled-size-12"
    case youtubeFilledSize16 = "youtube-filled-size-16"
    case youtubeFilledSize20 = "youtube-filled-size-20"
    case youtubeFilledSize24 = "youtube-filled-size-24"
    case youtubeFilledSize32 = "youtube-filled-size-32"
    case youtubeSize12 = "youtube-size-12"
    case youtubeSize16 = "youtube-size-16"
    case youtubeSize20 = "youtube-size-20"
    case youtubeSize24 = "youtube-size-24"
    case youtubeSize32 = "youtube-size-32"
}

public extension Image {
    init(_ icon: FrostedIcon) {
        self.init(icon.rawValue, bundle: .module)
    }
}

public struct IconSet {
    public let size12: FrostedIcon
    public let size16: FrostedIcon
    public let size20: FrostedIcon
    public let size24: FrostedIcon
    public let size32: FrostedIcon

    public init(
        size12: FrostedIcon,
        size16: FrostedIcon,
        size20: FrostedIcon,
        size24: FrostedIcon,
        size32: FrostedIcon
    ) {
        self.size12 = size12
        self.size16 = size16
        self.size20 = size20
        self.size24 = size24
        self.size32 = size32
    }
}

public extension IconSet {

    static let addUser = IconSet(
        size12: .addUser12,
        size16: .addUser16,
        size20: .addUser20,
        size24: .addUser24,
        size32: .addUser32
    )

    static let alignCenter = IconSet(
        size12: .alignCenter12,
        size16: .alignCenter16,
        size20: .alignCenter20,
        size24: .alignCenter24,
        size32: .alignCenter32
    )

    static let alignLeft = IconSet(
        size12: .alignLeft12,
        size16: .alignLeft16,
        size20: .alignLeft20,
        size24: .alignLeft24,
        size32: .alignLeft32
    )

    static let alignRight = IconSet(
        size12: .alignRight12,
        size16: .alignRight16,
        size20: .alignRight20,
        size24: .alignRight24,
        size32: .alignRight32
    )

    static let apps = IconSet(
        size12: .apps12,
        size16: .apps16,
        size20: .apps20,
        size24: .apps24,
        size32: .apps32
    )

    static let arrowDown = IconSet(
        size12: .arrowDown12,
        size16: .arrowDown16,
        size20: .arrowDown20,
        size24: .arrowDown24,
        size32: .arrowDown32
    )

    static let arrowDownAngleLeft = IconSet(
        size12: .arrowDownAngleLeft12,
        size16: .arrowDownAngleLeft16,
        size20: .arrowDownAngleLeft20,
        size24: .arrowDownAngleLeft24,
        size32: .arrowDownAngleLeft32
    )

    static let arrowDownAngleRight = IconSet(
        size12: .arrowDownAngleRight12,
        size16: .arrowDownAngleRight16,
        size20: .arrowDownAngleRight20,
        size24: .arrowDownAngleRight24,
        size32: .arrowDownAngleRight32
    )

    static let arrowDownLeft = IconSet(
        size12: .arrowDownLeft12,
        size16: .arrowDownLeft16,
        size20: .arrowDownLeft20,
        size24: .arrowDownLeft24,
        size32: .arrowDownLeft32
    )

    static let arrowDownRight = IconSet(
        size12: .arrowDownRight12,
        size16: .arrowDownRight16,
        size20: .arrowDownRight20,
        size24: .arrowDownRight24,
        size32: .arrowDownRight32
    )

    static let arrowDownToLine = IconSet(
        size12: .arrowDownToLine12,
        size16: .arrowDownToLine16,
        size20: .arrowDownToLine20,
        size24: .arrowDownToLine24,
        size32: .arrowDownToLine32
    )

    static let arrowDownToLineSize = IconSet(
        size12: .arrowDownToLineSize12,
        size16: .arrowDownToLineSize16,
        size20: .arrowDownToLineSize20,
        size24: .arrowDownToLineSize24,
        size32: .arrowDownToLineSize32
    )

    static let arrowFatDown = IconSet(
        size12: .arrowFatDown12,
        size16: .arrowFatDown16,
        size20: .arrowFatDown20,
        size24: .arrowFatDown24,
        size32: .arrowFatDown32
    )

    static let arrowFatDownFilled = IconSet(
        size12: .arrowFatDownFilled12,
        size16: .arrowFatDownFilled16,
        size20: .arrowFatDownFilled20,
        size24: .arrowFatDownFilled24,
        size32: .arrowFatDownFilled32
    )

    static let arrowFatUp = IconSet(
        size12: .arrowFatUp12,
        size16: .arrowFatUp16,
        size20: .arrowFatUp20,
        size24: .arrowFatUp24,
        size32: .arrowFatUp32
    )

    static let arrowFatUpFilled = IconSet(
        size12: .arrowFatUpFilled12,
        size16: .arrowFatUpFilled16,
        size20: .arrowFatUpFilled20,
        size24: .arrowFatUpFilled24,
        size32: .arrowFatUpFilled32
    )

    static let arrowLeft = IconSet(
        size12: .arrowLeft12,
        size16: .arrowLeft16,
        size20: .arrowLeft20,
        size24: .arrowLeft24,
        size32: .arrowLeft32
    )

    static let arrowRight = IconSet(
        size12: .arrowRight12,
        size16: .arrowRight16,
        size20: .arrowRight20,
        size24: .arrowRight24,
        size32: .arrowRight32
    )

    static let arrowUp = IconSet(
        size12: .arrowUp12,
        size16: .arrowUp16,
        size20: .arrowUp20,
        size24: .arrowUp24,
        size32: .arrowUp32
    )

    static let arrowUpFromBracket = IconSet(
        size12: .arrowUpFromBracket12,
        size16: .arrowUpFromBracket16,
        size20: .arrowUpFromBracket20,
        size24: .arrowUpFromBracket24,
        size32: .arrowUpFromBracket32
    )

    static let arrowUpLeft = IconSet(
        size12: .arrowUpLeft12,
        size16: .arrowUpLeft16,
        size20: .arrowUpLeft20,
        size24: .arrowUpLeft24,
        size32: .arrowUpLeft32
    )

    static let arrowUpRight = IconSet(
        size12: .arrowUpRight12,
        size16: .arrowUpRight16,
        size20: .arrowUpRight20,
        size24: .arrowUpRight24,
        size32: .arrowUpRight32
    )

    static let arrowUpRightFromBracket = IconSet(
        size12: .arrowUpRightFromBracket12,
        size16: .arrowUpRightFromBracket16,
        size20: .arrowUpRightFromBracket20,
        size24: .arrowUpRightFromBracket24,
        size32: .arrowUpRightFromBracket32
    )

    static let arrowUpRightFromSquare = IconSet(
        size12: .arrowUpRightFromSquare12,
        size16: .arrowUpRightFromSquare16,
        size20: .arrowUpRightFromSquare20,
        size24: .arrowUpRightFromSquare24,
        size32: .arrowUpRightFromSquare32
    )

    static let arrowUpRightFromSquareFlush = IconSet(
        size12: .arrowUpRightFromSquareFlush12,
        size16: .arrowUpRightFromSquareFlush16,
        size20: .arrowUpRightFromSquareFlush20,
        size24: .arrowUpRightFromSquareFlush24,
        size32: .arrowUpRightFromSquareFlush32
    )

    static let atom = IconSet(
        size12: .atom12,
        size16: .atom16,
        size20: .atom20,
        size24: .atom24,
        size32: .atom32
    )

    static let ban = IconSet(
        size12: .ban12,
        size16: .ban16,
        size20: .ban20,
        size24: .ban24,
        size32: .ban32
    )

    static let bank = IconSet(
        size12: .bank12,
        size16: .bank16,
        size20: .bank20,
        size24: .bank24,
        size32: .bank32
    )

    static let bannerPhoto = IconSet(
        size12: .bannerPhoto12,
        size16: .bannerPhoto16,
        size20: .bannerPhoto20,
        size24: .bannerPhoto24,
        size32: .bannerPhoto32
    )

    static let barChart = IconSet(
        size12: .barChart12,
        size16: .barChart16,
        size20: .barChart20,
        size24: .barChart24,
        size32: .barChart32
    )

    static let barsFilter = IconSet(
        size12: .barsFilter12,
        size16: .barsFilter16,
        size20: .barsFilter20,
        size24: .barsFilter24,
        size32: .barsFilter32
    )

    static let beaker = IconSet(
        size12: .beaker12,
        size16: .beaker16,
        size20: .beaker20,
        size24: .beaker24,
        size32: .beaker32
    )

    static let beakerFilled = IconSet(
        size12: .beakerFilled12,
        size16: .beakerFilled16,
        size20: .beakerFilled20,
        size24: .beakerFilled24,
        size32: .beakerFilled32
    )

    static let bell = IconSet(
        size12: .bell12,
        size16: .bell16,
        size20: .bell20,
        size24: .bell24,
        size32: .bell32
    )

    static let bellSlash = IconSet(
        size12: .bellSlash12,
        size16: .bellSlash16,
        size20: .bellSlash20,
        size24: .bellSlash24,
        size32: .bellSlash32
    )

    static let bitcoin = IconSet(
        size12: .bitcoin12,
        size16: .bitcoin16,
        size20: .bitcoin20,
        size24: .bitcoin24,
        size32: .bitcoin32
    )

    static let bold = IconSet(
        size12: .bold12,
        size16: .bold16,
        size20: .bold20,
        size24: .bold24,
        size32: .bold32
    )

    static let book = IconSet(
        size12: .book12,
        size16: .book16,
        size20: .book20,
        size24: .book24,
        size32: .book32
    )

    static let browser = IconSet(
        size12: .browser12,
        size16: .browser16,
        size20: .browser20,
        size24: .browser24,
        size32: .browser32
    )

    static let bulb = IconSet(
        size12: .bulb12,
        size16: .bulb16,
        size20: .bulb20,
        size24: .bulb24,
        size32: .bulb32
    )

    static let burger = IconSet(
        size12: .burger12,
        size16: .burger16,
        size20: .burger20,
        size24: .burger24,
        size32: .burger32
    )

    static let calendar = IconSet(
        size12: .calendar12,
        size16: .calendar16,
        size20: .calendar20,
        size24: .calendar24,
        size32: .calendar32
    )

    static let calendarPlus = IconSet(
        size12: .calendarPlus12,
        size16: .calendarPlus16,
        size20: .calendarPlus20,
        size24: .calendarPlus24,
        size32: .calendarPlus32
    )

    static let calendarPlusSize = IconSet(
        size12: .calendarPlusSize12,
        size16: .calendarPlusSize16,
        size20: .calendarPlusSize20,
        size24: .calendarPlusSize24,
        size32: .calendarPlusSize32
    )

    static let calendarX = IconSet(
        size12: .calendarX12,
        size16: .calendarX16,
        size20: .calendarX20,
        size24: .calendarX24,
        size32: .calendarX32
    )

    static let calendarXSize = IconSet(
        size12: .calendarXSize12,
        size16: .calendarXSize16,
        size20: .calendarXSize20,
        size24: .calendarXSize24,
        size32: .calendarXSize32
    )

    static let camera = IconSet(
        size12: .camera12,
        size16: .camera16,
        size20: .camera20,
        size24: .camera24,
        size32: .camera32
    )

    static let cameraAdd = IconSet(
        size12: .cameraAdd12,
        size16: .cameraAdd16,
        size20: .cameraAdd20,
        size24: .cameraAdd24,
        size32: .cameraAdd32
    )

    static let cameraAddFilled = IconSet(
        size12: .cameraAddFilled12,
        size16: .cameraAddFilled16,
        size20: .cameraAddFilled20,
        size24: .cameraAddFilled24,
        size32: .cameraAddFilled32
    )

    static let cameraFilled = IconSet(
        size12: .cameraFilled12,
        size16: .cameraFilled16,
        size20: .cameraFilled20,
        size24: .cameraFilled24,
        size32: .cameraFilled32
    )

    static let cartRemove = IconSet(
        size12: .cartRemove12,
        size16: .cartRemove16,
        size20: .cartRemove20,
        size24: .cartRemove24,
        size32: .cartRemove32
    )

    static let chat = IconSet(
        size12: .chat12,
        size16: .chat16,
        size20: .chat20,
        size24: .chat24,
        size32: .chat32
    )

    static let checklist = IconSet(
        size12: .checklist12,
        size16: .checklist16,
        size20: .checklist20,
        size24: .checklist24,
        size32: .checklist32
    )

    static let checkmark = IconSet(
        size12: .checkmark12,
        size16: .checkmark16,
        size20: .checkmark20,
        size24: .checkmark24,
        size32: .checkmark32
    )

    static let checkmarkCircle = IconSet(
        size12: .checkmarkCircle12,
        size16: .checkmarkCircle16,
        size20: .checkmarkCircle20,
        size24: .checkmarkCircle24,
        size32: .checkmarkCircle32
    )

    static let checkmarkCircleFilled = IconSet(
        size12: .checkmarkCircleFilled12,
        size16: .checkmarkCircleFilled16,
        size20: .checkmarkCircleFilled20,
        size24: .checkmarkCircleFilled24,
        size32: .checkmarkCircleFilled32
    )

    static let checkmarkShield = IconSet(
        size12: .checkmarkShield12,
        size16: .checkmarkShield16,
        size20: .checkmarkShield20,
        size24: .checkmarkShield24,
        size32: .checkmarkShield32
    )

    static let chevronDown = IconSet(
        size12: .chevronDown12,
        size16: .chevronDown16,
        size20: .chevronDown20,
        size24: .chevronDown24,
        size32: .chevronDown32
    )

    static let chevronDownProperty1DownChevron = IconSet(
        size12: .chevronDownProperty1DownChevron12,
        size16: .chevronDownProperty1DownChevron16,
        size20: .chevronDownProperty1DownChevron20,
        size24: .chevronDownProperty1DownChevron24,
        size32: .chevronDownProperty1DownChevron32
    )

    static let chevronDownSize = IconSet(
        size12: .chevronDownSize12,
        size16: .chevronDownSize16,
        size20: .chevronDownSize20,
        size24: .chevronDownSize24,
        size32: .chevronDownSize32
    )

    static let chevronLeft = IconSet(
        size12: .chevronLeft12,
        size16: .chevronLeft16,
        size20: .chevronLeft20,
        size24: .chevronLeft24,
        size32: .chevronLeft32
    )

    static let chevronLeftProperty1BackChevron = IconSet(
        size12: .chevronLeftProperty1BackChevron12,
        size16: .chevronLeftProperty1BackChevron16,
        size20: .chevronLeftProperty1BackChevron20,
        size24: .chevronLeftProperty1BackChevron24,
        size32: .chevronLeftProperty1BackChevron32
    )

    static let chevronLeftSize = IconSet(
        size12: .chevronLeftSize12,
        size16: .chevronLeftSize16,
        size20: .chevronLeftSize20,
        size24: .chevronLeftSize24,
        size32: .chevronLeftSize32
    )

    static let chevronLeftToLineInBox = IconSet(
        size12: .chevronLeftToLineInBox12,
        size16: .chevronLeftToLineInBox16,
        size20: .chevronLeftToLineInBox20,
        size24: .chevronLeftToLineInBox24,
        size32: .chevronLeftToLineInBox32
    )

    static let chevronLeftToLineInBoxSize = IconSet(
        size12: .chevronLeftToLineInBoxSize12,
        size16: .chevronLeftToLineInBoxSize16,
        size20: .chevronLeftToLineInBoxSize20,
        size24: .chevronLeftToLineInBoxSize24,
        size32: .chevronLeftToLineInBoxSize32
    )

    static let chevronRight = IconSet(
        size12: .chevronRight12,
        size16: .chevronRight16,
        size20: .chevronRight20,
        size24: .chevronRight24,
        size32: .chevronRight32
    )

    static let chevronRightProperty1ForwardChevron = IconSet(
        size12: .chevronRightProperty1ForwardChevron12,
        size16: .chevronRightProperty1ForwardChevron16,
        size20: .chevronRightProperty1ForwardChevron20,
        size24: .chevronRightProperty1ForwardChevron24,
        size32: .chevronRightProperty1ForwardChevron32
    )

    static let chevronRightSize = IconSet(
        size12: .chevronRightSize12,
        size16: .chevronRightSize16,
        size20: .chevronRightSize20,
        size24: .chevronRightSize24,
        size32: .chevronRightSize32
    )

    static let chevronUp = IconSet(
        size12: .chevronUp12,
        size16: .chevronUp16,
        size20: .chevronUp20,
        size24: .chevronUp24,
        size32: .chevronUp32
    )

    static let chevronUpProperty1UpChevron = IconSet(
        size12: .chevronUpProperty1UpChevron12,
        size16: .chevronUpProperty1UpChevron16,
        size20: .chevronUpProperty1UpChevron20,
        size24: .chevronUpProperty1UpChevron24,
        size32: .chevronUpProperty1UpChevron32
    )

    static let chevronUpSize = IconSet(
        size12: .chevronUpSize12,
        size16: .chevronUpSize16,
        size20: .chevronUpSize20,
        size24: .chevronUpSize24,
        size32: .chevronUpSize32
    )

    static let clipboard = IconSet(
        size12: .clipboard12,
        size16: .clipboard16,
        size20: .clipboard20,
        size24: .clipboard24,
        size32: .clipboard32
    )

    static let clipboardSize = IconSet(
        size12: .clipboardSize12,
        size16: .clipboardSize16,
        size20: .clipboardSize20,
        size24: .clipboardSize24,
        size32: .clipboardSize32
    )

    static let clock = IconSet(
        size12: .clock12,
        size16: .clock16,
        size20: .clock20,
        size24: .clock24,
        size32: .clock32
    )

    static let clockFilled = IconSet(
        size12: .clockFilled12,
        size16: .clockFilled16,
        size20: .clockFilled20,
        size24: .clockFilled24,
        size32: .clockFilled32
    )

    static let closedCaptions = IconSet(
        size12: .closedCaptions12,
        size16: .closedCaptions16,
        size20: .closedCaptions20,
        size24: .closedCaptions24,
        size32: .closedCaptions32
    )

    static let code = IconSet(
        size12: .code12,
        size16: .code16,
        size20: .code20,
        size24: .code24,
        size32: .code32
    )

    static let codeblock = IconSet(
        size12: .codeblock12,
        size16: .codeblock16,
        size20: .codeblock20,
        size24: .codeblock24,
        size32: .codeblock32
    )

    static let coinbase = IconSet(
        size12: .coinbase12,
        size16: .coinbase16,
        size20: .coinbase20,
        size24: .coinbase24,
        size32: .coinbase32
    )

    static let collapseSidebar = IconSet(
        size12: .collapseSidebar12,
        size16: .collapseSidebar16,
        size20: .collapseSidebar20,
        size24: .collapseSidebar24,
        size32: .collapseSidebar32
    )

    static let collapseSidebarFilled = IconSet(
        size12: .collapseSidebarFilled12,
        size16: .collapseSidebarFilled16,
        size20: .collapseSidebarFilled20,
        size24: .collapseSidebarFilled24,
        size32: .collapseSidebarFilled32
    )

    static let command = IconSet(
        size12: .command12,
        size16: .command16,
        size20: .command20,
        size24: .command24,
        size32: .command32
    )

    static let compass = IconSet(
        size12: .compass12,
        size16: .compass16,
        size20: .compass20,
        size24: .compass24,
        size32: .compass32
    )

    static let compassFilled = IconSet(
        size12: .compassFilled12,
        size16: .compassFilled16,
        size20: .compassFilled20,
        size24: .compassFilled24,
        size32: .compassFilled32
    )

    static let component19 = IconSet(
        size12: .component1912,
        size16: .component1916,
        size20: .component1920,
        size24: .component1924,
        size32: .component1932
    )

    static let compress = IconSet(
        size12: .compress12,
        size16: .compress16,
        size20: .compress20,
        size24: .compress24,
        size32: .compress32
    )

    static let converge = IconSet(
        size12: .converge12,
        size16: .converge16,
        size20: .converge20,
        size24: .converge24,
        size32: .converge32
    )

    static let copy = IconSet(
        size12: .copy12,
        size16: .copy16,
        size20: .copy20,
        size24: .copy24,
        size32: .copy32
    )

    static let couponActive = IconSet(
        size12: .couponActive12,
        size16: .couponActive16,
        size20: .couponActive20,
        size24: .couponActive24,
        size32: .couponActive32
    )

    static let couponExpired = IconSet(
        size12: .couponExpired12,
        size16: .couponExpired16,
        size20: .couponExpired20,
        size24: .couponExpired24,
        size32: .couponExpired32
    )

    static let creditCard = IconSet(
        size12: .creditCard12,
        size16: .creditCard16,
        size20: .creditCard20,
        size24: .creditCard24,
        size32: .creditCard32
    )

    static let creditCardFilled = IconSet(
        size12: .creditCardFilled12,
        size16: .creditCardFilled16,
        size20: .creditCardFilled20,
        size24: .creditCardFilled24,
        size32: .creditCardFilled32
    )

    static let cube = IconSet(
        size12: .cube12,
        size16: .cube16,
        size20: .cube20,
        size24: .cube24,
        size32: .cube32
    )

    static let cubeDisconnected = IconSet(
        size12: .cubeDisconnected12,
        size16: .cubeDisconnected16,
        size20: .cubeDisconnected20,
        size24: .cubeDisconnected24,
        size32: .cubeDisconnected32
    )

    static let cubeFilled = IconSet(
        size12: .cubeFilled12,
        size16: .cubeFilled16,
        size20: .cubeFilled20,
        size24: .cubeFilled24,
        size32: .cubeFilled32
    )

    static let cubeSize = IconSet(
        size12: .cubeSize12,
        size16: .cubeSize16,
        size20: .cubeSize20,
        size24: .cubeSize24,
        size32: .cubeSize32
    )

    static let cursor = IconSet(
        size12: .cursor12,
        size16: .cursor16,
        size20: .cursor20,
        size24: .cursor24,
        size32: .cursor32
    )

    static let cursorFilled = IconSet(
        size12: .cursorFilled12,
        size16: .cursorFilled16,
        size20: .cursorFilled20,
        size24: .cursorFilled24,
        size32: .cursorFilled32
    )

    static let cursorOutline = IconSet(
        size12: .cursorOutline12,
        size16: .cursorOutline16,
        size20: .cursorOutline20,
        size24: .cursorOutline24,
        size32: .cursorOutline32
    )

    static let dashboard = IconSet(
        size12: .dashboard12,
        size16: .dashboard16,
        size20: .dashboard20,
        size24: .dashboard24,
        size32: .dashboard32
    )

    static let dashedCircle = IconSet(
        size12: .dashedCircle12,
        size16: .dashedCircle16,
        size20: .dashedCircle20,
        size24: .dashedCircle24,
        size32: .dashedCircle32
    )

    static let dice = IconSet(
        size12: .dice12,
        size16: .dice16,
        size20: .dice20,
        size24: .dice24,
        size32: .dice32
    )

    static let diceSize = IconSet(
        size12: .diceSize12,
        size16: .diceSize16,
        size20: .diceSize20,
        size24: .diceSize24,
        size32: .diceSize32
    )

    static let discord = IconSet(
        size12: .discord12,
        size16: .discord16,
        size20: .discord20,
        size24: .discord24,
        size32: .discord32
    )

    static let discordFilled = IconSet(
        size12: .discordFilled12,
        size16: .discordFilled16,
        size20: .discordFilled20,
        size24: .discordFilled24,
        size32: .discordFilled32
    )

    static let discordFilledSize = IconSet(
        size12: .discordFilledSize12,
        size16: .discordFilledSize16,
        size20: .discordFilledSize20,
        size24: .discordFilledSize24,
        size32: .discordFilledSize32
    )

    static let discordSize = IconSet(
        size12: .discordSize12,
        size16: .discordSize16,
        size20: .discordSize20,
        size24: .discordSize24,
        size32: .discordSize32
    )

    static let dna = IconSet(
        size12: .dna12,
        size16: .dna16,
        size20: .dna20,
        size24: .dna24,
        size32: .dna32
    )

    static let document = IconSet(
        size12: .document12,
        size16: .document16,
        size20: .document20,
        size24: .document24,
        size32: .document32
    )

    static let documentLines = IconSet(
        size12: .documentLines12,
        size16: .documentLines16,
        size20: .documentLines20,
        size24: .documentLines24,
        size32: .documentLines32
    )

    static let documentPlus = IconSet(
        size12: .documentPlus12,
        size16: .documentPlus16,
        size20: .documentPlus20,
        size24: .documentPlus24,
        size32: .documentPlus32
    )

    static let documentPlusSize = IconSet(
        size12: .documentPlusSize12,
        size16: .documentPlusSize16,
        size20: .documentPlusSize20,
        size24: .documentPlusSize24,
        size32: .documentPlusSize32
    )

    static let dollarCircle = IconSet(
        size12: .dollarCircle12,
        size16: .dollarCircle16,
        size20: .dollarCircle20,
        size24: .dollarCircle24,
        size32: .dollarCircle32
    )

    static let dollarCircleFilled = IconSet(
        size12: .dollarCircleFilled12,
        size16: .dollarCircleFilled16,
        size20: .dollarCircleFilled20,
        size24: .dollarCircleFilled24,
        size32: .dollarCircleFilled32
    )

    static let dollarSign = IconSet(
        size12: .dollarSign12,
        size16: .dollarSign16,
        size20: .dollarSign20,
        size24: .dollarSign24,
        size32: .dollarSign32
    )

    static let dollarSignSlashed = IconSet(
        size12: .dollarSignSlashed12,
        size16: .dollarSignSlashed16,
        size20: .dollarSignSlashed20,
        size24: .dollarSignSlashed24,
        size32: .dollarSignSlashed32
    )

    static let download = IconSet(
        size12: .download12,
        size16: .download16,
        size20: .download20,
        size24: .download24,
        size32: .download32
    )

    static let downloadDocument = IconSet(
        size12: .downloadDocument12,
        size16: .downloadDocument16,
        size20: .downloadDocument20,
        size24: .downloadDocument24,
        size32: .downloadDocument32
    )

    static let downloadDocumentFilled = IconSet(
        size12: .downloadDocumentFilled12,
        size16: .downloadDocumentFilled16,
        size20: .downloadDocumentFilled20,
        size24: .downloadDocumentFilled24,
        size32: .downloadDocumentFilled32
    )

    static let dragHandleHorizontal = IconSet(
        size12: .dragHandleHorizontal12,
        size16: .dragHandleHorizontal16,
        size20: .dragHandleHorizontal20,
        size24: .dragHandleHorizontal24,
        size32: .dragHandleHorizontal32
    )

    static let dragHandleVertical = IconSet(
        size12: .dragHandleVertical12,
        size16: .dragHandleVertical16,
        size20: .dragHandleVertical20,
        size24: .dragHandleVertical24,
        size32: .dragHandleVertical32
    )

    static let edit = IconSet(
        size12: .edit12,
        size16: .edit16,
        size20: .edit20,
        size24: .edit24,
        size32: .edit32
    )

    static let editProfile = IconSet(
        size12: .editProfile12,
        size16: .editProfile16,
        size20: .editProfile20,
        size24: .editProfile24,
        size32: .editProfile32
    )

    static let emailOut = IconSet(
        size12: .emailOut12,
        size16: .emailOut16,
        size20: .emailOut20,
        size24: .emailOut24,
        size32: .emailOut32
    )

    static let errorCircle = IconSet(
        size12: .errorCircle12,
        size16: .errorCircle16,
        size20: .errorCircle20,
        size24: .errorCircle24,
        size32: .errorCircle32
    )

    static let ethereum = IconSet(
        size12: .ethereum12,
        size16: .ethereum16,
        size20: .ethereum20,
        size24: .ethereum24,
        size32: .ethereum32
    )

    static let etherium = IconSet(
        size12: .etherium12,
        size16: .etherium16,
        size20: .etherium20,
        size24: .etherium24,
        size32: .etherium32
    )

    static let exclamationCircle = IconSet(
        size12: .exclamationCircle12,
        size16: .exclamationCircle16,
        size20: .exclamationCircle20,
        size24: .exclamationCircle24,
        size32: .exclamationCircle32
    )

    static let exclamationTriangle = IconSet(
        size12: .exclamationTriangle12,
        size16: .exclamationTriangle16,
        size20: .exclamationTriangle20,
        size24: .exclamationTriangle24,
        size32: .exclamationTriangle32
    )

    static let expand = IconSet(
        size12: .expand12,
        size16: .expand16,
        size20: .expand20,
        size24: .expand24,
        size32: .expand32
    )

    static let export = IconSet(
        size12: .export12,
        size16: .export16,
        size20: .export20,
        size24: .export24,
        size32: .export32
    )

    static let eye = IconSet(
        size12: .eye12,
        size16: .eye16,
        size20: .eye20,
        size24: .eye24,
        size32: .eye32
    )

    static let eyeSlashed = IconSet(
        size12: .eyeSlashed12,
        size16: .eyeSlashed16,
        size20: .eyeSlashed20,
        size24: .eyeSlashed24,
        size32: .eyeSlashed32
    )

    static let facebook = IconSet(
        size12: .facebook12,
        size16: .facebook16,
        size20: .facebook20,
        size24: .facebook24,
        size32: .facebook32
    )

    static let facebookFilled = IconSet(
        size12: .facebookFilled12,
        size16: .facebookFilled16,
        size20: .facebookFilled20,
        size24: .facebookFilled24,
        size32: .facebookFilled32
    )

    static let facebookFilledSize = IconSet(
        size12: .facebookFilledSize12,
        size16: .facebookFilledSize16,
        size20: .facebookFilledSize20,
        size24: .facebookFilledSize24,
        size32: .facebookFilledSize32
    )

    static let facebookSize = IconSet(
        size12: .facebookSize12,
        size16: .facebookSize16,
        size20: .facebookSize20,
        size24: .facebookSize24,
        size32: .facebookSize32
    )

    static let fileLines = IconSet(
        size12: .fileLines12,
        size16: .fileLines16,
        size20: .fileLines20,
        size24: .fileLines24,
        size32: .fileLines32
    )

    static let fileLinesSize = IconSet(
        size12: .fileLinesSize12,
        size16: .fileLinesSize16,
        size20: .fileLinesSize20,
        size24: .fileLinesSize24,
        size32: .fileLinesSize32
    )

    static let filterDown = IconSet(
        size12: .filterDown12,
        size16: .filterDown16,
        size20: .filterDown20,
        size24: .filterDown24,
        size32: .filterDown32
    )

    static let flag = IconSet(
        size12: .flag12,
        size16: .flag16,
        size20: .flag20,
        size24: .flag24,
        size32: .flag32
    )

    static let flagFilled = IconSet(
        size12: .flagFilled12,
        size16: .flagFilled16,
        size20: .flagFilled20,
        size24: .flagFilled24,
        size32: .flagFilled32
    )

    static let folderAdd = IconSet(
        size12: .folderAdd12,
        size16: .folderAdd16,
        size20: .folderAdd20,
        size24: .folderAdd24,
        size32: .folderAdd32
    )

    static let fullScreen = IconSet(
        size12: .fullScreen12,
        size16: .fullScreen16,
        size20: .fullScreen20,
        size24: .fullScreen24,
        size32: .fullScreen32
    )

    static let gamepad = IconSet(
        size12: .gamepad12,
        size16: .gamepad16,
        size20: .gamepad20,
        size24: .gamepad24,
        size32: .gamepad32
    )

    static let gamepadFilled = IconSet(
        size12: .gamepadFilled12,
        size16: .gamepadFilled16,
        size20: .gamepadFilled20,
        size24: .gamepadFilled24,
        size32: .gamepadFilled32
    )

    static let gear = IconSet(
        size12: .gear12,
        size16: .gear16,
        size20: .gear20,
        size24: .gear24,
        size32: .gear32
    )

    static let gif = IconSet(
        size12: .gif12,
        size16: .gif16,
        size20: .gif20,
        size24: .gif24,
        size32: .gif32
    )

    static let gifFilled = IconSet(
        size12: .gifFilled12,
        size16: .gifFilled16,
        size20: .gifFilled20,
        size24: .gifFilled24,
        size32: .gifFilled32
    )

    static let gift = IconSet(
        size12: .gift12,
        size16: .gift16,
        size20: .gift20,
        size24: .gift24,
        size32: .gift32
    )

    static let globe = IconSet(
        size12: .globe12,
        size16: .globe16,
        size20: .globe20,
        size24: .globe24,
        size32: .globe32
    )

    static let globeInSquare = IconSet(
        size12: .globeInSquare12,
        size16: .globeInSquare16,
        size20: .globeInSquare20,
        size24: .globeInSquare24,
        size32: .globeInSquare32
    )

    static let grid = IconSet(
        size12: .grid12,
        size16: .grid16,
        size20: .grid20,
        size24: .grid24,
        size32: .grid32
    )

    static let gridAdd = IconSet(
        size12: .gridAdd12,
        size16: .gridAdd16,
        size20: .gridAdd20,
        size24: .gridAdd24,
        size32: .gridAdd32
    )

    static let handWave = IconSet(
        size12: .handWave12,
        size16: .handWave16,
        size20: .handWave20,
        size24: .handWave24,
        size32: .handWave32
    )

    static let happy = IconSet(
        size12: .happy12,
        size16: .happy16,
        size20: .happy20,
        size24: .happy24,
        size32: .happy32
    )

    static let happyFaceFilled = IconSet(
        size12: .happyFaceFilled12,
        size16: .happyFaceFilled16,
        size20: .happyFaceFilled20,
        size24: .happyFaceFilled24,
        size32: .happyFaceFilled32
    )

    static let happyFacePlus = IconSet(
        size12: .happyFacePlus12,
        size16: .happyFacePlus16,
        size20: .happyFacePlus20,
        size24: .happyFacePlus24,
        size32: .happyFacePlus32
    )

    static let happyFilled = IconSet(
        size12: .happyFilled12,
        size16: .happyFilled16,
        size20: .happyFilled20,
        size24: .happyFilled24,
        size32: .happyFilled32
    )

    static let happyPlus = IconSet(
        size12: .happyPlus12,
        size16: .happyPlus16,
        size20: .happyPlus20,
        size24: .happyPlus24,
        size32: .happyPlus32
    )

    static let hashtag = IconSet(
        size12: .hashtag12,
        size16: .hashtag16,
        size20: .hashtag20,
        size24: .hashtag24,
        size32: .hashtag32
    )

    static let hashtagFilled = IconSet(
        size12: .hashtagFilled12,
        size16: .hashtagFilled16,
        size20: .hashtagFilled20,
        size24: .hashtagFilled24,
        size32: .hashtagFilled32
    )

    static let heading = IconSet(
        size12: .heading12,
        size16: .heading16,
        size20: .heading20,
        size24: .heading24,
        size32: .heading32
    )

    static let headphones = IconSet(
        size12: .headphones12,
        size16: .headphones16,
        size20: .headphones20,
        size24: .headphones24,
        size32: .headphones32
    )

    static let heart = IconSet(
        size12: .heart12,
        size16: .heart16,
        size20: .heart20,
        size24: .heart24,
        size32: .heart32
    )

    static let heartFilled = IconSet(
        size12: .heartFilled12,
        size16: .heartFilled16,
        size20: .heartFilled20,
        size24: .heartFilled24,
        size32: .heartFilled32
    )

    static let home = IconSet(
        size12: .home12,
        size16: .home16,
        size20: .home20,
        size24: .home24,
        size32: .home32
    )

    static let hourGlass = IconSet(
        size12: .hourGlass12,
        size16: .hourGlass16,
        size20: .hourGlass20,
        size24: .hourGlass24,
        size32: .hourGlass32
    )

    static let illuminati = IconSet(
        size12: .illuminati12,
        size16: .illuminati16,
        size20: .illuminati20,
        size24: .illuminati24,
        size32: .illuminati32
    )

    static let illuminatiFilled = IconSet(
        size12: .illuminatiFilled12,
        size16: .illuminatiFilled16,
        size20: .illuminatiFilled20,
        size24: .illuminatiFilled24,
        size32: .illuminatiFilled32
    )

    static let inbox = IconSet(
        size12: .inbox12,
        size16: .inbox16,
        size20: .inbox20,
        size24: .inbox24,
        size32: .inbox32
    )

    static let inboxSize = IconSet(
        size12: .inboxSize12,
        size16: .inboxSize16,
        size20: .inboxSize20,
        size24: .inboxSize24,
        size32: .inboxSize32
    )

    static let info = IconSet(
        size12: .info12,
        size16: .info16,
        size20: .info20,
        size24: .info24,
        size32: .info32
    )

    static let infoCircle = IconSet(
        size12: .infoCircle12,
        size16: .infoCircle16,
        size20: .infoCircle20,
        size24: .infoCircle24,
        size32: .infoCircle32
    )

    static let infoCircleFilled = IconSet(
        size12: .infoCircleFilled12,
        size16: .infoCircleFilled16,
        size20: .infoCircleFilled20,
        size24: .infoCircleFilled24,
        size32: .infoCircleFilled32
    )

    static let infoFilled = IconSet(
        size12: .infoFilled12,
        size16: .infoFilled16,
        size20: .infoFilled20,
        size24: .infoFilled24,
        size32: .infoFilled32
    )

    static let infoOutline = IconSet(
        size12: .infoOutline12,
        size16: .infoOutline16,
        size20: .infoOutline20,
        size24: .infoOutline24,
        size32: .infoOutline32
    )

    static let infoSize = IconSet(
        size12: .infoSize12,
        size16: .infoSize16,
        size20: .infoSize20,
        size24: .infoSize24,
        size32: .infoSize32
    )

    static let infoSquare = IconSet(
        size12: .infoSquare12,
        size16: .infoSquare16,
        size20: .infoSquare20,
        size24: .infoSquare24,
        size32: .infoSquare32
    )

    static let information = IconSet(
        size12: .information12,
        size16: .information16,
        size20: .information20,
        size24: .information24,
        size32: .information32
    )

    static let instagram = IconSet(
        size12: .instagram12,
        size16: .instagram16,
        size20: .instagram20,
        size24: .instagram24,
        size32: .instagram32
    )

    static let instagramSize = IconSet(
        size12: .instagramSize12,
        size16: .instagramSize16,
        size20: .instagramSize20,
        size24: .instagramSize24,
        size32: .instagramSize32
    )

    static let italic = IconSet(
        size12: .italic12,
        size16: .italic16,
        size20: .italic20,
        size24: .italic24,
        size32: .italic32
    )

    static let item = IconSet(
        size12: .item12,
        size16: .item16,
        size20: .item20,
        size24: .item24,
        size32: .item32
    )

    static let k = IconSet(
        size12: .k12,
        size16: .k16,
        size20: .k20,
        size24: .k24,
        size32: .k32
    )

    static let leaf = IconSet(
        size12: .leaf12,
        size16: .leaf16,
        size20: .leaf20,
        size24: .leaf24,
        size32: .leaf32
    )

    static let leaveReview = IconSet(
        size12: .leaveReview12,
        size16: .leaveReview16,
        size20: .leaveReview20,
        size24: .leaveReview24,
        size32: .leaveReview32
    )

    static let lightbulb = IconSet(
        size12: .lightbulb12,
        size16: .lightbulb16,
        size20: .lightbulb20,
        size24: .lightbulb24,
        size32: .lightbulb32
    )

    static let lightsOff = IconSet(
        size12: .lightsOff12,
        size16: .lightsOff16,
        size20: .lightsOff20,
        size24: .lightsOff24,
        size32: .lightsOff32
    )

    static let lightsOn = IconSet(
        size12: .lightsOn12,
        size16: .lightsOn16,
        size20: .lightsOn20,
        size24: .lightsOn24,
        size32: .lightsOn32
    )

    static let lilstNumber = IconSet(
        size12: .lilstNumber12,
        size16: .lilstNumber16,
        size20: .lilstNumber20,
        size24: .lilstNumber24,
        size32: .lilstNumber32
    )

    static let link = IconSet(
        size12: .link12,
        size16: .link16,
        size20: .link20,
        size24: .link24,
        size32: .link32
    )

    static let linkAdd = IconSet(
        size12: .linkAdd12,
        size16: .linkAdd16,
        size20: .linkAdd20,
        size24: .linkAdd24,
        size32: .linkAdd32
    )

    static let linkSlash = IconSet(
        size12: .linkSlash12,
        size16: .linkSlash16,
        size20: .linkSlash20,
        size24: .linkSlash24,
        size32: .linkSlash32
    )

    static let linkedin = IconSet(
        size12: .linkedin12,
        size16: .linkedin16,
        size20: .linkedin20,
        size24: .linkedin24,
        size32: .linkedin32
    )

    static let list = IconSet(
        size12: .list12,
        size16: .list16,
        size20: .list20,
        size24: .list24,
        size32: .list32
    )

    static let listBullet = IconSet(
        size12: .listBullet12,
        size16: .listBullet16,
        size20: .listBullet20,
        size24: .listBullet24,
        size32: .listBullet32
    )

    static let listCheck = IconSet(
        size12: .listCheck12,
        size16: .listCheck16,
        size20: .listCheck20,
        size24: .listCheck24,
        size32: .listCheck32
    )

    static let listNumber = IconSet(
        size12: .listNumber12,
        size16: .listNumber16,
        size20: .listNumber20,
        size24: .listNumber24,
        size32: .listNumber32
    )

    static let locationPin = IconSet(
        size12: .locationPin12,
        size16: .locationPin16,
        size20: .locationPin20,
        size24: .locationPin24,
        size32: .locationPin32
    )

    static let lock = IconSet(
        size12: .lock12,
        size16: .lock16,
        size20: .lock20,
        size24: .lock24,
        size32: .lock32
    )

    static let lockFilled = IconSet(
        size12: .lockFilled12,
        size16: .lockFilled16,
        size20: .lockFilled20,
        size24: .lockFilled24,
        size32: .lockFilled32
    )

    static let lockOpen = IconSet(
        size12: .lockOpen12,
        size16: .lockOpen16,
        size20: .lockOpen20,
        size24: .lockOpen24,
        size32: .lockOpen32
    )

    static let logout = IconSet(
        size12: .logout12,
        size16: .logout16,
        size20: .logout20,
        size24: .logout24,
        size32: .logout32
    )

    static let magnifyingGlass = IconSet(
        size12: .magnifyingGlass12,
        size16: .magnifyingGlass16,
        size20: .magnifyingGlass20,
        size24: .magnifyingGlass24,
        size32: .magnifyingGlass32
    )

    static let mail = IconSet(
        size12: .mail12,
        size16: .mail16,
        size20: .mail20,
        size24: .mail24,
        size32: .mail32
    )

    static let mailFilled = IconSet(
        size12: .mailFilled12,
        size16: .mailFilled16,
        size20: .mailFilled20,
        size24: .mailFilled24,
        size32: .mailFilled32
    )

    static let mailOut = IconSet(
        size12: .mailOut12,
        size16: .mailOut16,
        size20: .mailOut20,
        size24: .mailOut24,
        size32: .mailOut32
    )

    static let markAsRead = IconSet(
        size12: .markAsRead12,
        size16: .markAsRead16,
        size20: .markAsRead20,
        size24: .markAsRead24,
        size32: .markAsRead32
    )

    static let markAsUnread = IconSet(
        size12: .markAsUnread12,
        size16: .markAsUnread16,
        size20: .markAsUnread20,
        size24: .markAsUnread24,
        size32: .markAsUnread32
    )

    static let medalCheck = IconSet(
        size12: .medalCheck12,
        size16: .medalCheck16,
        size20: .medalCheck20,
        size24: .medalCheck24,
        size32: .medalCheck32
    )

    static let medalCheckSize = IconSet(
        size12: .medalCheckSize12,
        size16: .medalCheckSize16,
        size20: .medalCheckSize20,
        size24: .medalCheckSize24,
        size32: .medalCheckSize32
    )

    static let medalCheckmark = IconSet(
        size12: .medalCheckmark12,
        size16: .medalCheckmark16,
        size20: .medalCheckmark20,
        size24: .medalCheckmark24,
        size32: .medalCheckmark32
    )

    static let megaphone = IconSet(
        size12: .megaphone12,
        size16: .megaphone16,
        size20: .megaphone20,
        size24: .megaphone24,
        size32: .megaphone32
    )

    static let mentionFilled = IconSet(
        size12: .mentionFilled12,
        size16: .mentionFilled16,
        size20: .mentionFilled20,
        size24: .mentionFilled24,
        size32: .mentionFilled32
    )

    static let menu = IconSet(
        size12: .menu12,
        size16: .menu16,
        size20: .menu20,
        size24: .menu24,
        size32: .menu32
    )

    static let merch = IconSet(
        size12: .merch12,
        size16: .merch16,
        size20: .merch20,
        size24: .merch24,
        size32: .merch32
    )

    static let message = IconSet(
        size12: .message12,
        size16: .message16,
        size20: .message20,
        size24: .message24,
        size32: .message32
    )

    static let messageEdit = IconSet(
        size12: .messageEdit12,
        size16: .messageEdit16,
        size20: .messageEdit20,
        size24: .messageEdit24,
        size32: .messageEdit32
    )

    static let messageFilled = IconSet(
        size12: .messageFilled12,
        size16: .messageFilled16,
        size20: .messageFilled20,
        size24: .messageFilled24,
        size32: .messageFilled32
    )

    static let messageNotification = IconSet(
        size12: .messageNotification12,
        size16: .messageNotification16,
        size20: .messageNotification20,
        size24: .messageNotification24,
        size32: .messageNotification32
    )

    static let messageSlashed = IconSet(
        size12: .messageSlashed12,
        size16: .messageSlashed16,
        size20: .messageSlashed20,
        size24: .messageSlashed24,
        size32: .messageSlashed32
    )

    static let messages = IconSet(
        size12: .messages12,
        size16: .messages16,
        size20: .messages20,
        size24: .messages24,
        size32: .messages32
    )

    static let messagesQuestion = IconSet(
        size12: .messagesQuestion12,
        size16: .messagesQuestion16,
        size20: .messagesQuestion20,
        size24: .messagesQuestion24,
        size32: .messagesQuestion32
    )

    static let micOff = IconSet(
        size12: .micOff12,
        size16: .micOff16,
        size20: .micOff20,
        size24: .micOff24,
        size32: .micOff32
    )

    static let micOn = IconSet(
        size12: .micOn12,
        size16: .micOn16,
        size20: .micOn20,
        size24: .micOn24,
        size32: .micOn32
    )

    static let microphone = IconSet(
        size12: .microphone12,
        size16: .microphone16,
        size20: .microphone20,
        size24: .microphone24,
        size32: .microphone32
    )

    static let microphoneOff = IconSet(
        size12: .microphoneOff12,
        size16: .microphoneOff16,
        size20: .microphoneOff20,
        size24: .microphoneOff24,
        size32: .microphoneOff32
    )

    static let minimize = IconSet(
        size12: .minimize12,
        size16: .minimize16,
        size20: .minimize20,
        size24: .minimize24,
        size32: .minimize32
    )

    static let mobilePhone = IconSet(
        size12: .mobilePhone12,
        size16: .mobilePhone16,
        size20: .mobilePhone20,
        size24: .mobilePhone24,
        size32: .mobilePhone32
    )

    static let mobilePhoneSize = IconSet(
        size12: .mobilePhoneSize12,
        size16: .mobilePhoneSize16,
        size20: .mobilePhoneSize20,
        size24: .mobilePhoneSize24,
        size32: .mobilePhoneSize32
    )

    static let monitor = IconSet(
        size12: .monitor12,
        size16: .monitor16,
        size20: .monitor20,
        size24: .monitor24,
        size32: .monitor32
    )

    static let monitorSize = IconSet(
        size12: .monitorSize12,
        size16: .monitorSize16,
        size20: .monitorSize20,
        size24: .monitorSize24,
        size32: .monitorSize32
    )

    static let moon = IconSet(
        size12: .moon12,
        size16: .moon16,
        size20: .moon20,
        size24: .moon24,
        size32: .moon32
    )

    static let moonFilled = IconSet(
        size12: .moonFilled12,
        size16: .moonFilled16,
        size20: .moonFilled20,
        size24: .moonFilled24,
        size32: .moonFilled32
    )

    static let moonSize = IconSet(
        size12: .moonSize12,
        size16: .moonSize16,
        size20: .moonSize20,
        size24: .moonSize24,
        size32: .moonSize32
    )

    static let notificationBellCrossed = IconSet(
        size12: .notificationBellCrossed12,
        size16: .notificationBellCrossed16,
        size20: .notificationBellCrossed20,
        size24: .notificationBellCrossed24,
        size32: .notificationBellCrossed32
    )

    static let palette = IconSet(
        size12: .palette12,
        size16: .palette16,
        size20: .palette20,
        size24: .palette24,
        size32: .palette32
    )

    static let paperAirplaneFilled = IconSet(
        size12: .paperAirplaneFilled12,
        size16: .paperAirplaneFilled16,
        size20: .paperAirplaneFilled20,
        size24: .paperAirplaneFilled24,
        size32: .paperAirplaneFilled32
    )

    static let paperAirplaneFilledUp = IconSet(
        size12: .paperAirplaneFilledUp12,
        size16: .paperAirplaneFilledUp16,
        size20: .paperAirplaneFilledUp20,
        size24: .paperAirplaneFilledUp24,
        size32: .paperAirplaneFilledUp32
    )

    static let paperAirplaneUpFilled = IconSet(
        size12: .paperAirplaneUpFilled12,
        size16: .paperAirplaneUpFilled16,
        size20: .paperAirplaneUpFilled20,
        size24: .paperAirplaneUpFilled24,
        size32: .paperAirplaneUpFilled32
    )

    static let parachute = IconSet(
        size12: .parachute12,
        size16: .parachute16,
        size20: .parachute20,
        size24: .parachute24,
        size32: .parachute32
    )

    static let participants = IconSet(
        size12: .participants12,
        size16: .participants16,
        size20: .participants20,
        size24: .participants24,
        size32: .participants32
    )

    static let pause = IconSet(
        size12: .pause12,
        size16: .pause16,
        size20: .pause20,
        size24: .pause24,
        size32: .pause32
    )

    static let pauseCircle = IconSet(
        size12: .pauseCircle12,
        size16: .pauseCircle16,
        size20: .pauseCircle20,
        size24: .pauseCircle24,
        size32: .pauseCircle32
    )

    static let pauseFilled = IconSet(
        size12: .pauseFilled12,
        size16: .pauseFilled16,
        size20: .pauseFilled20,
        size24: .pauseFilled24,
        size32: .pauseFilled32
    )

    static let paypal = IconSet(
        size12: .paypal12,
        size16: .paypal16,
        size20: .paypal20,
        size24: .paypal24,
        size32: .paypal32
    )

    static let pencil = IconSet(
        size12: .pencil12,
        size16: .pencil16,
        size20: .pencil20,
        size24: .pencil24,
        size32: .pencil32
    )

    static let people = IconSet(
        size12: .people12,
        size16: .people16,
        size20: .people20,
        size24: .people24,
        size32: .people32
    )

    static let people2 = IconSet(
        size12: .people212,
        size16: .people216,
        size20: .people220,
        size24: .people224,
        size32: .people232
    )

    static let peoplePlus = IconSet(
        size12: .peoplePlus12,
        size16: .peoplePlus16,
        size20: .peoplePlus20,
        size24: .peoplePlus24,
        size32: .peoplePlus32
    )

    static let percentage = IconSet(
        size12: .percentage12,
        size16: .percentage16,
        size20: .percentage20,
        size24: .percentage24,
        size32: .percentage32
    )

    static let photo = IconSet(
        size12: .photo12,
        size16: .photo16,
        size20: .photo20,
        size24: .photo24,
        size32: .photo32
    )

    static let photoFilled = IconSet(
        size12: .photoFilled12,
        size16: .photoFilled16,
        size20: .photoFilled20,
        size24: .photoFilled24,
        size32: .photoFilled32
    )

    static let photos = IconSet(
        size12: .photos12,
        size16: .photos16,
        size20: .photos20,
        size24: .photos24,
        size32: .photos32
    )

    static let pictureInPicture = IconSet(
        size12: .pictureInPicture12,
        size16: .pictureInPicture16,
        size20: .pictureInPicture20,
        size24: .pictureInPicture24,
        size32: .pictureInPicture32
    )

    static let pin = IconSet(
        size12: .pin12,
        size16: .pin16,
        size20: .pin20,
        size24: .pin24,
        size32: .pin32
    )

    static let pinFilled = IconSet(
        size12: .pinFilled12,
        size16: .pinFilled16,
        size20: .pinFilled20,
        size24: .pinFilled24,
        size32: .pinFilled32
    )

    static let pinTilted = IconSet(
        size12: .pinTilted12,
        size16: .pinTilted16,
        size20: .pinTilted20,
        size24: .pinTilted24,
        size32: .pinTilted32
    )

    static let pinTiltedFilled = IconSet(
        size12: .pinTiltedFilled12,
        size16: .pinTiltedFilled16,
        size20: .pinTiltedFilled20,
        size24: .pinTiltedFilled24,
        size32: .pinTiltedFilled32
    )

    static let plane = IconSet(
        size12: .plane12,
        size16: .plane16,
        size20: .plane20,
        size24: .plane24,
        size32: .plane32
    )

    static let play = IconSet(
        size12: .play12,
        size16: .play16,
        size20: .play20,
        size24: .play24,
        size32: .play32
    )

    static let playCircle = IconSet(
        size12: .playCircle12,
        size16: .playCircle16,
        size20: .playCircle20,
        size24: .playCircle24,
        size32: .playCircle32
    )

    static let playFilled = IconSet(
        size12: .playFilled12,
        size16: .playFilled16,
        size20: .playFilled20,
        size24: .playFilled24,
        size32: .playFilled32
    )

    static let plus = IconSet(
        size12: .plus12,
        size16: .plus16,
        size20: .plus20,
        size24: .plus24,
        size32: .plus32
    )

    static let plusCircle = IconSet(
        size12: .plusCircle12,
        size16: .plusCircle16,
        size20: .plusCircle20,
        size24: .plusCircle24,
        size32: .plusCircle32
    )

    static let plusRectangle = IconSet(
        size12: .plusRectangle12,
        size16: .plusRectangle16,
        size20: .plusRectangle20,
        size24: .plusRectangle24,
        size32: .plusRectangle32
    )

    static let profile = IconSet(
        size12: .profile12,
        size16: .profile16,
        size20: .profile20,
        size24: .profile24,
        size32: .profile32
    )

    static let profileCircle = IconSet(
        size12: .profileCircle12,
        size16: .profileCircle16,
        size20: .profileCircle20,
        size24: .profileCircle24,
        size32: .profileCircle32
    )

    static let profileFilled = IconSet(
        size12: .profileFilled12,
        size16: .profileFilled16,
        size20: .profileFilled20,
        size24: .profileFilled24,
        size32: .profileFilled32
    )

    static let profileX = IconSet(
        size12: .profileX12,
        size16: .profileX16,
        size20: .profileX20,
        size24: .profileX24,
        size32: .profileX32
    )

    static let questionCircle = IconSet(
        size12: .questionCircle12,
        size16: .questionCircle16,
        size20: .questionCircle20,
        size24: .questionCircle24,
        size32: .questionCircle32
    )

    static let quoteLeft = IconSet(
        size12: .quoteLeft12,
        size16: .quoteLeft16,
        size20: .quoteLeft20,
        size24: .quoteLeft24,
        size32: .quoteLeft32
    )

    static let quoteRight = IconSet(
        size12: .quoteRight12,
        size16: .quoteRight16,
        size20: .quoteRight20,
        size24: .quoteRight24,
        size32: .quoteRight32
    )

    static let raiseHand = IconSet(
        size12: .raiseHand12,
        size16: .raiseHand16,
        size20: .raiseHand20,
        size24: .raiseHand24,
        size32: .raiseHand32
    )

    static let receipt = IconSet(
        size12: .receipt12,
        size16: .receipt16,
        size20: .receipt20,
        size24: .receipt24,
        size32: .receipt32
    )

    static let receptionBell = IconSet(
        size12: .receptionBell12,
        size16: .receptionBell16,
        size20: .receptionBell20,
        size24: .receptionBell24,
        size32: .receptionBell32
    )

    static let receptionBellFilled = IconSet(
        size12: .receptionBellFilled12,
        size16: .receptionBellFilled16,
        size20: .receptionBellFilled20,
        size24: .receptionBellFilled24,
        size32: .receptionBellFilled32
    )

    static let rectangleStack = IconSet(
        size12: .rectangleStack12,
        size16: .rectangleStack16,
        size20: .rectangleStack20,
        size24: .rectangleStack24,
        size32: .rectangleStack32
    )

    static let refresh = IconSet(
        size12: .refresh12,
        size16: .refresh16,
        size20: .refresh20,
        size24: .refresh24,
        size32: .refresh32
    )

    static let refund = IconSet(
        size12: .refund12,
        size16: .refund16,
        size20: .refund20,
        size24: .refund24,
        size32: .refund32
    )

    static let reply = IconSet(
        size12: .reply12,
        size16: .reply16,
        size20: .reply20,
        size24: .reply24,
        size32: .reply32
    )

    static let replyFilled = IconSet(
        size12: .replyFilled12,
        size16: .replyFilled16,
        size20: .replyFilled20,
        size24: .replyFilled24,
        size32: .replyFilled32
    )

    static let rewardDiamond = IconSet(
        size12: .rewardDiamond12,
        size16: .rewardDiamond16,
        size20: .rewardDiamond20,
        size24: .rewardDiamond24,
        size32: .rewardDiamond32
    )

    static let rocket = IconSet(
        size12: .rocket12,
        size16: .rocket16,
        size20: .rocket20,
        size24: .rocket24,
        size32: .rocket32
    )

    static let rotate = IconSet(
        size12: .rotate12,
        size16: .rotate16,
        size20: .rotate20,
        size24: .rotate24,
        size32: .rotate32
    )

    static let rotateCard = IconSet(
        size12: .rotateCard12,
        size16: .rotateCard16,
        size20: .rotateCard20,
        size24: .rotateCard24,
        size32: .rotateCard32
    )

    static let rotateLeft = IconSet(
        size12: .rotateLeft12,
        size16: .rotateLeft16,
        size20: .rotateLeft20,
        size24: .rotateLeft24,
        size32: .rotateLeft32
    )

    static let rotateLeftSize = IconSet(
        size12: .rotateLeftSize12,
        size16: .rotateLeftSize16,
        size20: .rotateLeftSize20,
        size24: .rotateLeftSize24,
        size32: .rotateLeftSize32
    )

    static let rotateRight = IconSet(
        size12: .rotateRight12,
        size16: .rotateRight16,
        size20: .rotateRight20,
        size24: .rotateRight24,
        size32: .rotateRight32
    )

    static let rotateRightSize = IconSet(
        size12: .rotateRightSize12,
        size16: .rotateRightSize16,
        size20: .rotateRightSize20,
        size24: .rotateRightSize24,
        size32: .rotateRightSize32
    )

    static let roundedArrowAngleLeft = IconSet(
        size12: .roundedArrowAngleLeft12,
        size16: .roundedArrowAngleLeft16,
        size20: .roundedArrowAngleLeft20,
        size24: .roundedArrowAngleLeft24,
        size32: .roundedArrowAngleLeft32
    )

    static let roundedArrowAngleRight = IconSet(
        size12: .roundedArrowAngleRight12,
        size16: .roundedArrowAngleRight16,
        size20: .roundedArrowAngleRight20,
        size24: .roundedArrowAngleRight24,
        size32: .roundedArrowAngleRight32
    )

    static let sad = IconSet(
        size12: .sad12,
        size16: .sad16,
        size20: .sad20,
        size24: .sad24,
        size32: .sad32
    )

    static let sadFace = IconSet(
        size12: .sadFace12,
        size16: .sadFace16,
        size20: .sadFace20,
        size24: .sadFace24,
        size32: .sadFace32
    )

    static let sadFaceFilled = IconSet(
        size12: .sadFaceFilled12,
        size16: .sadFaceFilled16,
        size20: .sadFaceFilled20,
        size24: .sadFaceFilled24,
        size32: .sadFaceFilled32
    )

    static let sadFilled = IconSet(
        size12: .sadFilled12,
        size16: .sadFilled16,
        size20: .sadFilled20,
        size24: .sadFilled24,
        size32: .sadFilled32
    )

    static let sealCheckmark = IconSet(
        size12: .sealCheckmark12,
        size16: .sealCheckmark16,
        size20: .sealCheckmark20,
        size24: .sealCheckmark24,
        size32: .sealCheckmark32
    )

    static let sealCheckmarkFilled = IconSet(
        size12: .sealCheckmarkFilled12,
        size16: .sealCheckmarkFilled16,
        size20: .sealCheckmarkFilled20,
        size24: .sealCheckmarkFilled24,
        size32: .sealCheckmarkFilled32
    )

    static let sealExclamation = IconSet(
        size12: .sealExclamation12,
        size16: .sealExclamation16,
        size20: .sealExclamation20,
        size24: .sealExclamation24,
        size32: .sealExclamation32
    )

    static let sealExclamationFilled = IconSet(
        size12: .sealExclamationFilled12,
        size16: .sealExclamationFilled16,
        size20: .sealExclamationFilled20,
        size24: .sealExclamationFilled24,
        size32: .sealExclamationFilled32
    )

    static let shareNodes = IconSet(
        size12: .shareNodes12,
        size16: .shareNodes16,
        size20: .shareNodes20,
        size24: .shareNodes24,
        size32: .shareNodes32
    )

    static let shareScreen = IconSet(
        size12: .shareScreen12,
        size16: .shareScreen16,
        size20: .shareScreen20,
        size24: .shareScreen24,
        size32: .shareScreen32
    )

    static let shieldCheckmark = IconSet(
        size12: .shieldCheckmark12,
        size16: .shieldCheckmark16,
        size20: .shieldCheckmark20,
        size24: .shieldCheckmark24,
        size32: .shieldCheckmark32
    )

    static let shieldHalf = IconSet(
        size12: .shieldHalf12,
        size16: .shieldHalf16,
        size20: .shieldHalf20,
        size24: .shieldHalf24,
        size32: .shieldHalf32
    )

    static let shop = IconSet(
        size12: .shop12,
        size16: .shop16,
        size20: .shop20,
        size24: .shop24,
        size32: .shop32
    )

    static let shoppingBag = IconSet(
        size12: .shoppingBag12,
        size16: .shoppingBag16,
        size20: .shoppingBag20,
        size24: .shoppingBag24,
        size32: .shoppingBag32
    )

    static let sparkle = IconSet(
        size12: .sparkle12,
        size16: .sparkle16,
        size20: .sparkle20,
        size24: .sparkle24,
        size32: .sparkle32
    )

    static let sparkleFilled = IconSet(
        size12: .sparkleFilled12,
        size16: .sparkleFilled16,
        size20: .sparkleFilled20,
        size24: .sparkleFilled24,
        size32: .sparkleFilled32
    )

    static let sparkleMultiple = IconSet(
        size12: .sparkleMultiple12,
        size16: .sparkleMultiple16,
        size20: .sparkleMultiple20,
        size24: .sparkleMultiple24,
        size32: .sparkleMultiple32
    )

    static let sparkleRectangle = IconSet(
        size12: .sparkleRectangle12,
        size16: .sparkleRectangle16,
        size20: .sparkleRectangle20,
        size24: .sparkleRectangle24,
        size32: .sparkleRectangle32
    )

    static let sparkles = IconSet(
        size12: .sparkles12,
        size16: .sparkles16,
        size20: .sparkles20,
        size24: .sparkles24,
        size32: .sparkles32
    )

    static let speaker = IconSet(
        size12: .speaker12,
        size16: .speaker16,
        size20: .speaker20,
        size24: .speaker24,
        size32: .speaker32
    )

    static let split = IconSet(
        size12: .split12,
        size16: .split16,
        size20: .split20,
        size24: .split24,
        size32: .split32
    )

    static let squareAdd = IconSet(
        size12: .squareAdd12,
        size16: .squareAdd16,
        size20: .squareAdd20,
        size24: .squareAdd24,
        size32: .squareAdd32
    )

    static let star = IconSet(
        size12: .star12,
        size16: .star16,
        size20: .star20,
        size24: .star24,
        size32: .star32
    )

    static let starFilled = IconSet(
        size12: .starFilled12,
        size16: .starFilled16,
        size20: .starFilled20,
        size24: .starFilled24,
        size32: .starFilled32
    )

    static let starHalf = IconSet(
        size12: .starHalf12,
        size16: .starHalf16,
        size20: .starHalf20,
        size24: .starHalf24,
        size32: .starHalf32
    )

    static let stats = IconSet(
        size12: .stats12,
        size16: .stats16,
        size20: .stats20,
        size24: .stats24,
        size32: .stats32
    )

    static let sticker = IconSet(
        size12: .sticker12,
        size16: .sticker16,
        size20: .sticker20,
        size24: .sticker24,
        size32: .sticker32
    )

    static let stickerFilled = IconSet(
        size12: .stickerFilled12,
        size16: .stickerFilled16,
        size20: .stickerFilled20,
        size24: .stickerFilled24,
        size32: .stickerFilled32
    )

    static let store = IconSet(
        size12: .store12,
        size16: .store16,
        size20: .store20,
        size24: .store24,
        size32: .store32
    )

    static let storefrontItem = IconSet(
        size12: .storefrontItem12,
        size16: .storefrontItem16,
        size20: .storefrontItem20,
        size24: .storefrontItem24,
        size32: .storefrontItem32
    )

    static let strikethrough = IconSet(
        size12: .strikethrough12,
        size16: .strikethrough16,
        size20: .strikethrough20,
        size24: .strikethrough24,
        size32: .strikethrough32
    )

    static let subtract = IconSet(
        size12: .subtract12,
        size16: .subtract16,
        size20: .subtract20,
        size24: .subtract24,
        size32: .subtract32
    )

    static let sun = IconSet(
        size12: .sun12,
        size16: .sun16,
        size20: .sun20,
        size24: .sun24,
        size32: .sun32
    )

    static let sunSize = IconSet(
        size12: .sunSize12,
        size16: .sunSize16,
        size20: .sunSize20,
        size24: .sunSize24,
        size32: .sunSize32
    )

    static let swords = IconSet(
        size12: .swords12,
        size16: .swords16,
        size20: .swords20,
        size24: .swords24,
        size32: .swords32
    )

    static let tShirt = IconSet(
        size12: .tShirt12,
        size16: .tShirt16,
        size20: .tShirt20,
        size24: .tShirt24,
        size32: .tShirt32
    )

    static let tShirtFilled = IconSet(
        size12: .tShirtFilled12,
        size16: .tShirtFilled16,
        size20: .tShirtFilled20,
        size24: .tShirtFilled24,
        size32: .tShirtFilled32
    )

    static let table = IconSet(
        size12: .table12,
        size16: .table16,
        size20: .table20,
        size24: .table24,
        size32: .table32
    )

    static let tableSize = IconSet(
        size12: .tableSize12,
        size16: .tableSize16,
        size20: .tableSize20,
        size24: .tableSize24,
        size32: .tableSize32
    )

    static let tag = IconSet(
        size12: .tag12,
        size16: .tag16,
        size20: .tag20,
        size24: .tag24,
        size32: .tag32
    )

    static let telegram = IconSet(
        size12: .telegram12,
        size16: .telegram16,
        size20: .telegram20,
        size24: .telegram24,
        size32: .telegram32
    )

    static let telegramFilled = IconSet(
        size12: .telegramFilled12,
        size16: .telegramFilled16,
        size20: .telegramFilled20,
        size24: .telegramFilled24,
        size32: .telegramFilled32
    )

    static let telegramFilledSize = IconSet(
        size12: .telegramFilledSize12,
        size16: .telegramFilledSize16,
        size20: .telegramFilledSize20,
        size24: .telegramFilledSize24,
        size32: .telegramFilledSize32
    )

    static let telegramSize = IconSet(
        size12: .telegramSize12,
        size16: .telegramSize16,
        size20: .telegramSize20,
        size24: .telegramSize24,
        size32: .telegramSize32
    )

    static let telephone = IconSet(
        size12: .telephone12,
        size16: .telephone16,
        size20: .telephone20,
        size24: .telephone24,
        size32: .telephone32
    )

    static let threeDotsCircle = IconSet(
        size12: .threeDotsCircle12,
        size16: .threeDotsCircle16,
        size20: .threeDotsCircle20,
        size24: .threeDotsCircle24,
        size32: .threeDotsCircle32
    )

    static let threeDotsCircleSize = IconSet(
        size12: .threeDotsCircleSize12,
        size16: .threeDotsCircleSize16,
        size20: .threeDotsCircleSize20,
        size24: .threeDotsCircleSize24,
        size32: .threeDotsCircleSize32
    )

    static let threeDotsHorizontal = IconSet(
        size12: .threeDotsHorizontal12,
        size16: .threeDotsHorizontal16,
        size20: .threeDotsHorizontal20,
        size24: .threeDotsHorizontal24,
        size32: .threeDotsHorizontal32
    )

    static let threeDotsVertical = IconSet(
        size12: .threeDotsVertical12,
        size16: .threeDotsVertical16,
        size20: .threeDotsVertical20,
        size24: .threeDotsVertical24,
        size32: .threeDotsVertical32
    )

    static let thumbDown = IconSet(
        size12: .thumbDown12,
        size16: .thumbDown16,
        size20: .thumbDown20,
        size24: .thumbDown24,
        size32: .thumbDown32
    )

    static let thumbDownFilled = IconSet(
        size12: .thumbDownFilled12,
        size16: .thumbDownFilled16,
        size20: .thumbDownFilled20,
        size24: .thumbDownFilled24,
        size32: .thumbDownFilled32
    )

    static let thumbUp = IconSet(
        size12: .thumbUp12,
        size16: .thumbUp16,
        size20: .thumbUp20,
        size24: .thumbUp24,
        size32: .thumbUp32
    )

    static let thumbUpFilled = IconSet(
        size12: .thumbUpFilled12,
        size16: .thumbUpFilled16,
        size20: .thumbUpFilled20,
        size24: .thumbUpFilled24,
        size32: .thumbUpFilled32
    )

    static let tikTok = IconSet(
        size12: .tikTok12,
        size16: .tikTok16,
        size20: .tikTok20,
        size24: .tikTok24,
        size32: .tikTok32
    )

    static let tikTokFilled = IconSet(
        size12: .tikTokFilled12,
        size16: .tikTokFilled16,
        size20: .tikTokFilled20,
        size24: .tikTokFilled24,
        size32: .tikTokFilled32
    )

    static let tiktok = IconSet(
        size12: .tiktok12,
        size16: .tiktok16,
        size20: .tiktok20,
        size24: .tiktok24,
        size32: .tiktok32
    )

    static let tiktokFilled = IconSet(
        size12: .tiktokFilled12,
        size16: .tiktokFilled16,
        size20: .tiktokFilled20,
        size24: .tiktokFilled24,
        size32: .tiktokFilled32
    )

    static let tiktokFilledSize = IconSet(
        size12: .tiktokFilledSize12,
        size16: .tiktokFilledSize16,
        size20: .tiktokFilledSize20,
        size24: .tiktokFilledSize24,
        size32: .tiktokFilledSize32
    )

    static let tiktokSize = IconSet(
        size12: .tiktokSize12,
        size16: .tiktokSize16,
        size20: .tiktokSize20,
        size24: .tiktokSize24,
        size32: .tiktokSize32
    )

    static let timeSkipLeft = IconSet(
        size12: .timeSkipLeft12,
        size16: .timeSkipLeft16,
        size20: .timeSkipLeft20,
        size24: .timeSkipLeft24,
        size32: .timeSkipLeft32
    )

    static let timeSkipRight = IconSet(
        size12: .timeSkipRight12,
        size16: .timeSkipRight16,
        size20: .timeSkipRight20,
        size24: .timeSkipRight24,
        size32: .timeSkipRight32
    )

    static let tradingView = IconSet(
        size12: .tradingView12,
        size16: .tradingView16,
        size20: .tradingView20,
        size24: .tradingView24,
        size32: .tradingView32
    )

    static let tradingview = IconSet(
        size12: .tradingview12,
        size16: .tradingview16,
        size20: .tradingview20,
        size24: .tradingview24,
        size32: .tradingview32
    )

    static let trash = IconSet(
        size12: .trash12,
        size16: .trash16,
        size20: .trash20,
        size24: .trash24,
        size32: .trash32
    )

    static let trashFilled = IconSet(
        size12: .trashFilled12,
        size16: .trashFilled16,
        size20: .trashFilled20,
        size24: .trashFilled24,
        size32: .trashFilled32
    )

    static let trashSolid = IconSet(
        size12: .trashSolid12,
        size16: .trashSolid16,
        size20: .trashSolid20,
        size24: .trashSolid24,
        size32: .trashSolid32
    )

    static let trophy = IconSet(
        size12: .trophy12,
        size16: .trophy16,
        size20: .trophy20,
        size24: .trophy24,
        size32: .trophy32
    )

    static let truck = IconSet(
        size12: .truck12,
        size16: .truck16,
        size20: .truck20,
        size24: .truck24,
        size32: .truck32
    )

    static let twitch = IconSet(
        size12: .twitch12,
        size16: .twitch16,
        size20: .twitch20,
        size24: .twitch24,
        size32: .twitch32
    )

    static let twitter = IconSet(
        size12: .twitter12,
        size16: .twitter16,
        size20: .twitter20,
        size24: .twitter24,
        size32: .twitter32
    )

    static let twitterFilled = IconSet(
        size12: .twitterFilled12,
        size16: .twitterFilled16,
        size20: .twitterFilled20,
        size24: .twitterFilled24,
        size32: .twitterFilled32
    )

    static let twitterFilledSize = IconSet(
        size12: .twitterFilledSize12,
        size16: .twitterFilledSize16,
        size20: .twitterFilledSize20,
        size24: .twitterFilledSize24,
        size32: .twitterFilledSize32
    )

    static let twitterSize = IconSet(
        size12: .twitterSize12,
        size16: .twitterSize16,
        size20: .twitterSize20,
        size24: .twitterSize24,
        size32: .twitterSize32
    )

    static let typography = IconSet(
        size12: .typography12,
        size16: .typography16,
        size20: .typography20,
        size24: .typography24,
        size32: .typography32
    )

    static let underline = IconSet(
        size12: .underline12,
        size16: .underline16,
        size20: .underline20,
        size24: .underline24,
        size32: .underline32
    )

    static let unpin = IconSet(
        size12: .unpin12,
        size16: .unpin16,
        size20: .unpin20,
        size24: .unpin24,
        size32: .unpin32
    )

    static let unpinFilled = IconSet(
        size12: .unpinFilled12,
        size16: .unpinFilled16,
        size20: .unpinFilled20,
        size24: .unpinFilled24,
        size32: .unpinFilled32
    )

    static let upinTilted = IconSet(
        size12: .upinTilted12,
        size16: .upinTilted16,
        size20: .upinTilted20,
        size24: .upinTilted24,
        size32: .upinTilted32
    )

    static let upinTiltedFilled = IconSet(
        size12: .upinTiltedFilled12,
        size16: .upinTiltedFilled16,
        size20: .upinTiltedFilled20,
        size24: .upinTiltedFilled24,
        size32: .upinTiltedFilled32
    )

    static let upload = IconSet(
        size12: .upload12,
        size16: .upload16,
        size20: .upload20,
        size24: .upload24,
        size32: .upload32
    )

    static let usd = IconSet(
        size12: .usd12,
        size16: .usd16,
        size20: .usd20,
        size24: .usd24,
        size32: .usd32
    )

    static let user = IconSet(
        size12: .user12,
        size16: .user16,
        size20: .user20,
        size24: .user24,
        size32: .user32
    )

    static let verifiedCheck = IconSet(
        size12: .verifiedCheck12,
        size16: .verifiedCheck16,
        size20: .verifiedCheck20,
        size24: .verifiedCheck24,
        size32: .verifiedCheck32
    )

    static let videoFilled = IconSet(
        size12: .videoFilled12,
        size16: .videoFilled16,
        size20: .videoFilled20,
        size24: .videoFilled24,
        size32: .videoFilled32
    )

    static let volumeHigh = IconSet(
        size12: .volumeHigh12,
        size16: .volumeHigh16,
        size20: .volumeHigh20,
        size24: .volumeHigh24,
        size32: .volumeHigh32
    )

    static let volumeLow = IconSet(
        size12: .volumeLow12,
        size16: .volumeLow16,
        size20: .volumeLow20,
        size24: .volumeLow24,
        size32: .volumeLow32
    )

    static let volumeOff = IconSet(
        size12: .volumeOff12,
        size16: .volumeOff16,
        size20: .volumeOff20,
        size24: .volumeOff24,
        size32: .volumeOff32
    )

    static let wallet = IconSet(
        size12: .wallet12,
        size16: .wallet16,
        size20: .wallet20,
        size24: .wallet24,
        size32: .wallet32
    )

    static let waveform = IconSet(
        size12: .waveform12,
        size16: .waveform16,
        size20: .waveform20,
        size24: .waveform24,
        size32: .waveform32
    )

    static let webcamOff = IconSet(
        size12: .webcamOff12,
        size16: .webcamOff16,
        size20: .webcamOff20,
        size24: .webcamOff24,
        size32: .webcamOff32
    )

    static let webcamOn = IconSet(
        size12: .webcamOn12,
        size16: .webcamOn16,
        size20: .webcamOn20,
        size24: .webcamOn24,
        size32: .webcamOn32
    )

    static let whopLogo = IconSet(
        size12: .whopLogo12,
        size16: .whopLogo16,
        size20: .whopLogo20,
        size24: .whopLogo24,
        size32: .whopLogo32
    )

    static let whopLogoSize = IconSet(
        size12: .whopLogoSize12,
        size16: .whopLogoSize16,
        size20: .whopLogoSize20,
        size24: .whopLogoSize24,
        size32: .whopLogoSize32
    )

    static let xCircle = IconSet(
        size12: .xCircle12,
        size16: .xCircle16,
        size20: .xCircle20,
        size24: .xCircle24,
        size32: .xCircle32
    )

    static let xCircleFilled = IconSet(
        size12: .xCircleFilled12,
        size16: .xCircleFilled16,
        size20: .xCircleFilled20,
        size24: .xCircleFilled24,
        size32: .xCircleFilled32
    )

    static let xCircleSize = IconSet(
        size12: .xCircleSize12,
        size16: .xCircleSize16,
        size20: .xCircleSize20,
        size24: .xCircleSize24,
        size32: .xCircleSize32
    )

    static let xDotCom = IconSet(
        size12: .xDotCom12,
        size16: .xDotCom16,
        size20: .xDotCom20,
        size24: .xDotCom24,
        size32: .xDotCom32
    )

    static let xDotComSize = IconSet(
        size12: .xDotComSize12,
        size16: .xDotComSize16,
        size20: .xDotComSize20,
        size24: .xDotComSize24,
        size32: .xDotComSize32
    )

    static let xMark = IconSet(
        size12: .xMark12,
        size16: .xMark16,
        size20: .xMark20,
        size24: .xMark24,
        size32: .xMark32
    )

    static let youTube = IconSet(
        size12: .youTube12,
        size16: .youTube16,
        size20: .youTube20,
        size24: .youTube24,
        size32: .youTube32
    )

    static let youTubeFilled = IconSet(
        size12: .youTubeFilled12,
        size16: .youTubeFilled16,
        size20: .youTubeFilled20,
        size24: .youTubeFilled24,
        size32: .youTubeFilled32
    )

    static let youtube = IconSet(
        size12: .youtube12,
        size16: .youtube16,
        size20: .youtube20,
        size24: .youtube24,
        size32: .youtube32
    )

    static let youtubeFilled = IconSet(
        size12: .youtubeFilled12,
        size16: .youtubeFilled16,
        size20: .youtubeFilled20,
        size24: .youtubeFilled24,
        size32: .youtubeFilled32
    )

    static let youtubeFilledSize = IconSet(
        size12: .youtubeFilledSize12,
        size16: .youtubeFilledSize16,
        size20: .youtubeFilledSize20,
        size24: .youtubeFilledSize24,
        size32: .youtubeFilledSize32
    )

    static let youtubeSize = IconSet(
        size12: .youtubeSize12,
        size16: .youtubeSize16,
        size20: .youtubeSize20,
        size24: .youtubeSize24,
        size32: .youtubeSize32
    )
}
