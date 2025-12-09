import SwiftUI

public enum FrostedIcon: String, CaseIterable, Identifiable {
    public var id: String { rawValue }

    case addUser12 = "addUser12"
    case addUser16 = "addUser16"
    case addUser20 = "addUser20"
    case addUser24 = "addUser24"
    case addUser32 = "addUser32"
    case alignCenter12 = "alignCenter12"
    case alignCenter16 = "alignCenter16"
    case alignCenter20 = "alignCenter20"
    case alignCenter24 = "alignCenter24"
    case alignCenter32 = "alignCenter32"
    case alignLeft12 = "alignLeft12"
    case alignLeft16 = "alignLeft16"
    case alignLeft20 = "alignLeft20"
    case alignLeft24 = "alignLeft24"
    case alignLeft32 = "alignLeft32"
    case alignRight12 = "alignRight12"
    case alignRight16 = "alignRight16"
    case alignRight20 = "alignRight20"
    case alignRight24 = "alignRight24"
    case alignRight32 = "alignRight32"
    case apps12 = "apps12"
    case apps16 = "apps16"
    case apps20 = "apps20"
    case apps24 = "apps24"
    case apps32 = "apps32"
    case arrowDown12 = "arrowDown12"
    case arrowDown16 = "arrowDown16"
    case arrowDown20 = "arrowDown20"
    case arrowDown24 = "arrowDown24"
    case arrowDown32 = "arrowDown32"
    case arrowDownAngleLeft12 = "arrowDownAngleLeft12"
    case arrowDownAngleLeft16 = "arrowDownAngleLeft16"
    case arrowDownAngleLeft20 = "arrowDownAngleLeft20"
    case arrowDownAngleLeft24 = "arrowDownAngleLeft24"
    case arrowDownAngleLeft32 = "arrowDownAngleLeft32"
    case arrowDownAngleRight12 = "arrowDownAngleRight12"
    case arrowDownAngleRight16 = "arrowDownAngleRight16"
    case arrowDownAngleRight20 = "arrowDownAngleRight20"
    case arrowDownAngleRight24 = "arrowDownAngleRight24"
    case arrowDownAngleRight32 = "arrowDownAngleRight32"
    case arrowDownLeft12 = "arrowDownLeft12"
    case arrowDownLeft16 = "arrowDownLeft16"
    case arrowDownLeft20 = "arrowDownLeft20"
    case arrowDownLeft24 = "arrowDownLeft24"
    case arrowDownLeft32 = "arrowDownLeft32"
    case arrowDownRight12 = "arrowDownRight12"
    case arrowDownRight16 = "arrowDownRight16"
    case arrowDownRight20 = "arrowDownRight20"
    case arrowDownRight24 = "arrowDownRight24"
    case arrowDownRight32 = "arrowDownRight32"
    case arrowDownToLine12 = "arrowDownToLine12"
    case arrowDownToLine16 = "arrowDownToLine16"
    case arrowDownToLine20 = "arrowDownToLine20"
    case arrowDownToLine24 = "arrowDownToLine24"
    case arrowDownToLine32 = "arrowDownToLine32"
    case arrowDownToLineSize12 = "arrowDownToLineSize12"
    case arrowDownToLineSize16 = "arrowDownToLineSize16"
    case arrowDownToLineSize20 = "arrowDownToLineSize20"
    case arrowDownToLineSize24 = "arrowDownToLineSize24"
    case arrowDownToLineSize32 = "arrowDownToLineSize32"
    case arrowFatDown12 = "arrowFatDown12"
    case arrowFatDown16 = "arrowFatDown16"
    case arrowFatDown20 = "arrowFatDown20"
    case arrowFatDown24 = "arrowFatDown24"
    case arrowFatDown32 = "arrowFatDown32"
    case arrowFatDownFilled12 = "arrowFatDownFilled12"
    case arrowFatDownFilled16 = "arrowFatDownFilled16"
    case arrowFatDownFilled20 = "arrowFatDownFilled20"
    case arrowFatDownFilled24 = "arrowFatDownFilled24"
    case arrowFatDownFilled32 = "arrowFatDownFilled32"
    case arrowFatUp12 = "arrowFatUp12"
    case arrowFatUp16 = "arrowFatUp16"
    case arrowFatUp20 = "arrowFatUp20"
    case arrowFatUp24 = "arrowFatUp24"
    case arrowFatUp32 = "arrowFatUp32"
    case arrowFatUpFilled12 = "arrowFatUpFilled12"
    case arrowFatUpFilled16 = "arrowFatUpFilled16"
    case arrowFatUpFilled20 = "arrowFatUpFilled20"
    case arrowFatUpFilled24 = "arrowFatUpFilled24"
    case arrowFatUpFilled32 = "arrowFatUpFilled32"
    case arrowLeft12 = "arrowLeft12"
    case arrowLeft16 = "arrowLeft16"
    case arrowLeft20 = "arrowLeft20"
    case arrowLeft24 = "arrowLeft24"
    case arrowLeft32 = "arrowLeft32"
    case arrowRight12 = "arrowRight12"
    case arrowRight16 = "arrowRight16"
    case arrowRight20 = "arrowRight20"
    case arrowRight24 = "arrowRight24"
    case arrowRight32 = "arrowRight32"
    case arrowUp12 = "arrowUp12"
    case arrowUp16 = "arrowUp16"
    case arrowUp20 = "arrowUp20"
    case arrowUp24 = "arrowUp24"
    case arrowUp32 = "arrowUp32"
    case arrowUpFromBracket12 = "arrowUpFromBracket12"
    case arrowUpFromBracket16 = "arrowUpFromBracket16"
    case arrowUpFromBracket20 = "arrowUpFromBracket20"
    case arrowUpFromBracket24 = "arrowUpFromBracket24"
    case arrowUpFromBracket32 = "arrowUpFromBracket32"
    case arrowUpLeft12 = "arrowUpLeft12"
    case arrowUpLeft16 = "arrowUpLeft16"
    case arrowUpLeft20 = "arrowUpLeft20"
    case arrowUpLeft24 = "arrowUpLeft24"
    case arrowUpLeft32 = "arrowUpLeft32"
    case arrowUpRight12 = "arrowUpRight12"
    case arrowUpRight16 = "arrowUpRight16"
    case arrowUpRight20 = "arrowUpRight20"
    case arrowUpRight24 = "arrowUpRight24"
    case arrowUpRight32 = "arrowUpRight32"
    case arrowUpRightFromBracket12 = "arrowUpRightFromBracket12"
    case arrowUpRightFromBracket16 = "arrowUpRightFromBracket16"
    case arrowUpRightFromBracket20 = "arrowUpRightFromBracket20"
    case arrowUpRightFromBracket24 = "arrowUpRightFromBracket24"
    case arrowUpRightFromBracket32 = "arrowUpRightFromBracket32"
    case arrowUpRightFromSquare12 = "arrowUpRightFromSquare12"
    case arrowUpRightFromSquare16 = "arrowUpRightFromSquare16"
    case arrowUpRightFromSquare20 = "arrowUpRightFromSquare20"
    case arrowUpRightFromSquare24 = "arrowUpRightFromSquare24"
    case arrowUpRightFromSquare32 = "arrowUpRightFromSquare32"
    case arrowUpRightFromSquareFlush12 = "arrowUpRightFromSquareFlush12"
    case arrowUpRightFromSquareFlush16 = "arrowUpRightFromSquareFlush16"
    case arrowUpRightFromSquareFlush20 = "arrowUpRightFromSquareFlush20"
    case arrowUpRightFromSquareFlush24 = "arrowUpRightFromSquareFlush24"
    case arrowUpRightFromSquareFlush32 = "arrowUpRightFromSquareFlush32"
    case atom12 = "atom12"
    case atom16 = "atom16"
    case atom20 = "atom20"
    case atom24 = "atom24"
    case atom32 = "atom32"
    case ban12 = "ban12"
    case ban16 = "ban16"
    case ban20 = "ban20"
    case ban24 = "ban24"
    case ban32 = "ban32"
    case bank12 = "bank12"
    case bank16 = "bank16"
    case bank20 = "bank20"
    case bank24 = "bank24"
    case bank32 = "bank32"
    case bannerPhoto12 = "bannerPhoto12"
    case bannerPhoto16 = "bannerPhoto16"
    case bannerPhoto20 = "bannerPhoto20"
    case bannerPhoto24 = "bannerPhoto24"
    case bannerPhoto32 = "bannerPhoto32"
    case barChart12 = "barChart12"
    case barChart16 = "barChart16"
    case barChart20 = "barChart20"
    case barChart24 = "barChart24"
    case barChart32 = "barChart32"
    case barsFilter12 = "barsFilter12"
    case barsFilter16 = "barsFilter16"
    case barsFilter20 = "barsFilter20"
    case barsFilter24 = "barsFilter24"
    case barsFilter32 = "barsFilter32"
    case beaker12 = "beaker12"
    case beaker16 = "beaker16"
    case beaker20 = "beaker20"
    case beaker24 = "beaker24"
    case beaker32 = "beaker32"
    case beakerFilled12 = "beakerFilled12"
    case beakerFilled16 = "beakerFilled16"
    case beakerFilled20 = "beakerFilled20"
    case beakerFilled24 = "beakerFilled24"
    case beakerFilled32 = "beakerFilled32"
    case bell12 = "bell12"
    case bell16 = "bell16"
    case bell20 = "bell20"
    case bell24 = "bell24"
    case bell32 = "bell32"
    case bellSlash12 = "bellSlash12"
    case bellSlash16 = "bellSlash16"
    case bellSlash20 = "bellSlash20"
    case bellSlash24 = "bellSlash24"
    case bellSlash32 = "bellSlash32"
    case bitcoin12 = "bitcoin12"
    case bitcoin16 = "bitcoin16"
    case bitcoin20 = "bitcoin20"
    case bitcoin24 = "bitcoin24"
    case bitcoin32 = "bitcoin32"
    case bold12 = "bold12"
    case bold16 = "bold16"
    case bold20 = "bold20"
    case bold24 = "bold24"
    case bold32 = "bold32"
    case book12 = "book12"
    case book16 = "book16"
    case book20 = "book20"
    case book24 = "book24"
    case book32 = "book32"
    case browser12 = "browser12"
    case browser16 = "browser16"
    case browser20 = "browser20"
    case browser24 = "browser24"
    case browser32 = "browser32"
    case bulb12 = "bulb12"
    case bulb16 = "bulb16"
    case bulb20 = "bulb20"
    case bulb24 = "bulb24"
    case bulb32 = "bulb32"
    case burger12 = "burger12"
    case burger16 = "burger16"
    case burger20 = "burger20"
    case burger24 = "burger24"
    case burger32 = "burger32"
    case calendar12 = "calendar12"
    case calendar16 = "calendar16"
    case calendar20 = "calendar20"
    case calendar24 = "calendar24"
    case calendar32 = "calendar32"
    case calendarPlus12 = "calendarPlus12"
    case calendarPlus16 = "calendarPlus16"
    case calendarPlus20 = "calendarPlus20"
    case calendarPlus24 = "calendarPlus24"
    case calendarPlus32 = "calendarPlus32"
    case calendarPlusSize12 = "calendarPlusSize12"
    case calendarPlusSize16 = "calendarPlusSize16"
    case calendarPlusSize20 = "calendarPlusSize20"
    case calendarPlusSize24 = "calendarPlusSize24"
    case calendarPlusSize32 = "calendarPlusSize32"
    case calendarX12 = "calendarX12"
    case calendarX16 = "calendarX16"
    case calendarX20 = "calendarX20"
    case calendarX24 = "calendarX24"
    case calendarX32 = "calendarX32"
    case calendarXSize12 = "calendarXSize12"
    case calendarXSize16 = "calendarXSize16"
    case calendarXSize20 = "calendarXSize20"
    case calendarXSize24 = "calendarXSize24"
    case calendarXSize32 = "calendarXSize32"
    case camera12 = "camera12"
    case camera16 = "camera16"
    case camera20 = "camera20"
    case camera24 = "camera24"
    case camera32 = "camera32"
    case cameraAdd12 = "cameraAdd12"
    case cameraAdd16 = "cameraAdd16"
    case cameraAdd20 = "cameraAdd20"
    case cameraAdd24 = "cameraAdd24"
    case cameraAdd32 = "cameraAdd32"
    case cameraAddFilled12 = "cameraAddFilled12"
    case cameraAddFilled16 = "cameraAddFilled16"
    case cameraAddFilled20 = "cameraAddFilled20"
    case cameraAddFilled24 = "cameraAddFilled24"
    case cameraAddFilled32 = "cameraAddFilled32"
    case cameraFilled12 = "cameraFilled12"
    case cameraFilled16 = "cameraFilled16"
    case cameraFilled20 = "cameraFilled20"
    case cameraFilled24 = "cameraFilled24"
    case cameraFilled32 = "cameraFilled32"
    case cartRemove12 = "cartRemove12"
    case cartRemove16 = "cartRemove16"
    case cartRemove20 = "cartRemove20"
    case cartRemove24 = "cartRemove24"
    case cartRemove32 = "cartRemove32"
    case chat12 = "chat12"
    case chat16 = "chat16"
    case chat20 = "chat20"
    case chat24 = "chat24"
    case chat32 = "chat32"
    case checklist12 = "checklist12"
    case checklist16 = "checklist16"
    case checklist20 = "checklist20"
    case checklist24 = "checklist24"
    case checklist32 = "checklist32"
    case checkmark12 = "checkmark12"
    case checkmark16 = "checkmark16"
    case checkmark20 = "checkmark20"
    case checkmark24 = "checkmark24"
    case checkmark32 = "checkmark32"
    case checkmarkCircle12 = "checkmarkCircle12"
    case checkmarkCircle16 = "checkmarkCircle16"
    case checkmarkCircle20 = "checkmarkCircle20"
    case checkmarkCircle24 = "checkmarkCircle24"
    case checkmarkCircle32 = "checkmarkCircle32"
    case checkmarkCircleFilled12 = "checkmarkCircleFilled12"
    case checkmarkCircleFilled16 = "checkmarkCircleFilled16"
    case checkmarkCircleFilled20 = "checkmarkCircleFilled20"
    case checkmarkCircleFilled24 = "checkmarkCircleFilled24"
    case checkmarkCircleFilled32 = "checkmarkCircleFilled32"
    case checkmarkShield12 = "checkmarkShield12"
    case checkmarkShield16 = "checkmarkShield16"
    case checkmarkShield20 = "checkmarkShield20"
    case checkmarkShield24 = "checkmarkShield24"
    case checkmarkShield32 = "checkmarkShield32"
    case chevronDown12 = "chevronDown12"
    case chevronDown16 = "chevronDown16"
    case chevronDown20 = "chevronDown20"
    case chevronDown24 = "chevronDown24"
    case chevronDown32 = "chevronDown32"
    case chevronDownProperty1DownChevron12 = "chevronDownProperty1DownChevron12"
    case chevronDownSize16 = "chevronDownSize16"
    case chevronDownSize20 = "chevronDownSize20"
    case chevronDownSize24 = "chevronDownSize24"
    case chevronDownSize32 = "chevronDownSize32"
    case chevronLeft12 = "chevronLeft12"
    case chevronLeft16 = "chevronLeft16"
    case chevronLeft20 = "chevronLeft20"
    case chevronLeft24 = "chevronLeft24"
    case chevronLeft32 = "chevronLeft32"
    case chevronLeftProperty1BackChevron12 = "chevronLeftProperty1BackChevron12"
    case chevronLeftSize16 = "chevronLeftSize16"
    case chevronLeftSize20 = "chevronLeftSize20"
    case chevronLeftSize24 = "chevronLeftSize24"
    case chevronLeftSize32 = "chevronLeftSize32"
    case chevronLeftToLineInBox12 = "chevronLeftToLineInBox12"
    case chevronLeftToLineInBox16 = "chevronLeftToLineInBox16"
    case chevronLeftToLineInBox20 = "chevronLeftToLineInBox20"
    case chevronLeftToLineInBox24 = "chevronLeftToLineInBox24"
    case chevronLeftToLineInBox32 = "chevronLeftToLineInBox32"
    case chevronLeftToLineInBoxSize12 = "chevronLeftToLineInBoxSize12"
    case chevronLeftToLineInBoxSize16 = "chevronLeftToLineInBoxSize16"
    case chevronLeftToLineInBoxSize20 = "chevronLeftToLineInBoxSize20"
    case chevronLeftToLineInBoxSize24 = "chevronLeftToLineInBoxSize24"
    case chevronLeftToLineInBoxSize32 = "chevronLeftToLineInBoxSize32"
    case chevronRight12 = "chevronRight12"
    case chevronRight16 = "chevronRight16"
    case chevronRight20 = "chevronRight20"
    case chevronRight24 = "chevronRight24"
    case chevronRight32 = "chevronRight32"
    case chevronRightProperty1ForwardChevron12 = "chevronRightProperty1ForwardChevron12"
    case chevronRightSize16 = "chevronRightSize16"
    case chevronRightSize20 = "chevronRightSize20"
    case chevronRightSize24 = "chevronRightSize24"
    case chevronRightSize32 = "chevronRightSize32"
    case chevronUp12 = "chevronUp12"
    case chevronUp16 = "chevronUp16"
    case chevronUp20 = "chevronUp20"
    case chevronUp24 = "chevronUp24"
    case chevronUp32 = "chevronUp32"
    case chevronUpProperty1UpChevron12 = "chevronUpProperty1UpChevron12"
    case chevronUpSize16 = "chevronUpSize16"
    case chevronUpSize20 = "chevronUpSize20"
    case chevronUpSize24 = "chevronUpSize24"
    case chevronUpSize32 = "chevronUpSize32"
    case clipboard12 = "clipboard12"
    case clipboard16 = "clipboard16"
    case clipboard20 = "clipboard20"
    case clipboard24 = "clipboard24"
    case clipboard32 = "clipboard32"
    case clipboardSize12 = "clipboardSize12"
    case clipboardSize16 = "clipboardSize16"
    case clipboardSize20 = "clipboardSize20"
    case clipboardSize24 = "clipboardSize24"
    case clipboardSize32 = "clipboardSize32"
    case clock12 = "clock12"
    case clock16 = "clock16"
    case clock20 = "clock20"
    case clock24 = "clock24"
    case clock32 = "clock32"
    case clockFilled12 = "clockFilled12"
    case clockFilled16 = "clockFilled16"
    case clockFilled20 = "clockFilled20"
    case clockFilled24 = "clockFilled24"
    case clockFilled32 = "clockFilled32"
    case closedCaptions12 = "closedCaptions12"
    case closedCaptions16 = "closedCaptions16"
    case closedCaptions20 = "closedCaptions20"
    case closedCaptions24 = "closedCaptions24"
    case closedCaptions32 = "closedCaptions32"
    case code12 = "code12"
    case code16 = "code16"
    case code20 = "code20"
    case code24 = "code24"
    case code32 = "code32"
    case codeblock12 = "codeblock12"
    case codeblock16 = "codeblock16"
    case codeblock20 = "codeblock20"
    case codeblock24 = "codeblock24"
    case codeblock32 = "codeblock32"
    case coinbase12 = "coinbase12"
    case coinbase16 = "coinbase16"
    case coinbase20 = "coinbase20"
    case coinbase24 = "coinbase24"
    case coinbase32 = "coinbase32"
    case collapseSidebar12 = "collapseSidebar12"
    case collapseSidebar16 = "collapseSidebar16"
    case collapseSidebar20 = "collapseSidebar20"
    case collapseSidebar24 = "collapseSidebar24"
    case collapseSidebar32 = "collapseSidebar32"
    case collapseSidebarFilled12 = "collapseSidebarFilled12"
    case collapseSidebarFilled16 = "collapseSidebarFilled16"
    case collapseSidebarFilled20 = "collapseSidebarFilled20"
    case collapseSidebarFilled24 = "collapseSidebarFilled24"
    case collapseSidebarFilled32 = "collapseSidebarFilled32"
    case command12 = "command12"
    case command16 = "command16"
    case command20 = "command20"
    case command24 = "command24"
    case command32 = "command32"
    case compass12 = "compass12"
    case compass16 = "compass16"
    case compass20 = "compass20"
    case compass24 = "compass24"
    case compass32 = "compass32"
    case compassFilled12 = "compassFilled12"
    case compassFilled16 = "compassFilled16"
    case compassFilled20 = "compassFilled20"
    case compassFilled24 = "compassFilled24"
    case compassFilled32 = "compassFilled32"
    case component1912 = "component1912"
    case component1916 = "component1916"
    case component1920 = "component1920"
    case component1924 = "component1924"
    case component1932 = "component1932"
    case compress12 = "compress12"
    case compress16 = "compress16"
    case compress20 = "compress20"
    case compress24 = "compress24"
    case compress32 = "compress32"
    case converge12 = "converge12"
    case converge16 = "converge16"
    case converge20 = "converge20"
    case converge24 = "converge24"
    case converge32 = "converge32"
    case copy12 = "copy12"
    case copy16 = "copy16"
    case copy20 = "copy20"
    case copy24 = "copy24"
    case copy32 = "copy32"
    case couponActive12 = "couponActive12"
    case couponActive16 = "couponActive16"
    case couponActive20 = "couponActive20"
    case couponActive24 = "couponActive24"
    case couponActive32 = "couponActive32"
    case couponExpired12 = "couponExpired12"
    case couponExpired16 = "couponExpired16"
    case couponExpired20 = "couponExpired20"
    case couponExpired24 = "couponExpired24"
    case couponExpired32 = "couponExpired32"
    case creditCard12 = "creditCard12"
    case creditCard16 = "creditCard16"
    case creditCard20 = "creditCard20"
    case creditCard24 = "creditCard24"
    case creditCard32 = "creditCard32"
    case creditCardFilled12 = "creditCardFilled12"
    case creditCardFilled16 = "creditCardFilled16"
    case creditCardFilled20 = "creditCardFilled20"
    case creditCardFilled24 = "creditCardFilled24"
    case creditCardFilled32 = "creditCardFilled32"
    case cube12 = "cube12"
    case cube16 = "cube16"
    case cube20 = "cube20"
    case cube24 = "cube24"
    case cube32 = "cube32"
    case cubeDisconnected12 = "cubeDisconnected12"
    case cubeDisconnected16 = "cubeDisconnected16"
    case cubeDisconnected20 = "cubeDisconnected20"
    case cubeDisconnected24 = "cubeDisconnected24"
    case cubeDisconnected32 = "cubeDisconnected32"
    case cubeFilled12 = "cubeFilled12"
    case cubeFilled16 = "cubeFilled16"
    case cubeFilled20 = "cubeFilled20"
    case cubeFilled24 = "cubeFilled24"
    case cubeFilled32 = "cubeFilled32"
    case cubeSize12 = "cubeSize12"
    case cubeSize16 = "cubeSize16"
    case cubeSize20 = "cubeSize20"
    case cubeSize24 = "cubeSize24"
    case cubeSize32 = "cubeSize32"
    case cursor12 = "cursor12"
    case cursor16 = "cursor16"
    case cursor20 = "cursor20"
    case cursor24 = "cursor24"
    case cursor32 = "cursor32"
    case cursorFilled12 = "cursorFilled12"
    case cursorFilled16 = "cursorFilled16"
    case cursorFilled20 = "cursorFilled20"
    case cursorFilled24 = "cursorFilled24"
    case cursorFilled32 = "cursorFilled32"
    case cursorOutline12 = "cursorOutline12"
    case cursorOutline16 = "cursorOutline16"
    case cursorOutline20 = "cursorOutline20"
    case cursorOutline24 = "cursorOutline24"
    case cursorOutline32 = "cursorOutline32"
    case dashboard12 = "dashboard12"
    case dashboard16 = "dashboard16"
    case dashboard20 = "dashboard20"
    case dashboard24 = "dashboard24"
    case dashboard32 = "dashboard32"
    case dashedCircle12 = "dashedCircle12"
    case dashedCircle16 = "dashedCircle16"
    case dashedCircle20 = "dashedCircle20"
    case dashedCircle24 = "dashedCircle24"
    case dashedCircle32 = "dashedCircle32"
    case dice12 = "dice12"
    case dice16 = "dice16"
    case dice20 = "dice20"
    case dice24 = "dice24"
    case dice32 = "dice32"
    case diceSize12 = "diceSize12"
    case diceSize16 = "diceSize16"
    case diceSize20 = "diceSize20"
    case diceSize24 = "diceSize24"
    case diceSize32 = "diceSize32"
    case discord12 = "discord12"
    case discord16 = "discord16"
    case discord20 = "discord20"
    case discord24 = "discord24"
    case discord32 = "discord32"
    case discordFilled12 = "discordFilled12"
    case discordFilled16 = "discordFilled16"
    case discordFilled20 = "discordFilled20"
    case discordFilled24 = "discordFilled24"
    case discordFilled32 = "discordFilled32"
    case discordFilledSize12 = "discordFilledSize12"
    case discordFilledSize16 = "discordFilledSize16"
    case discordFilledSize20 = "discordFilledSize20"
    case discordFilledSize24 = "discordFilledSize24"
    case discordFilledSize32 = "discordFilledSize32"
    case discordSize12 = "discordSize12"
    case discordSize16 = "discordSize16"
    case discordSize20 = "discordSize20"
    case discordSize24 = "discordSize24"
    case discordSize32 = "discordSize32"
    case dna12 = "dna12"
    case dna16 = "dna16"
    case dna20 = "dna20"
    case dna24 = "dna24"
    case dna32 = "dna32"
    case document12 = "document12"
    case document16 = "document16"
    case document20 = "document20"
    case document24 = "document24"
    case document32 = "document32"
    case documentLines12 = "documentLines12"
    case documentLines16 = "documentLines16"
    case documentLines20 = "documentLines20"
    case documentLines24 = "documentLines24"
    case documentLines32 = "documentLines32"
    case documentPlus12 = "documentPlus12"
    case documentPlus16 = "documentPlus16"
    case documentPlus20 = "documentPlus20"
    case documentPlus24 = "documentPlus24"
    case documentPlus32 = "documentPlus32"
    case dollarCircle12 = "dollarCircle12"
    case dollarCircle16 = "dollarCircle16"
    case dollarCircle20 = "dollarCircle20"
    case dollarCircle24 = "dollarCircle24"
    case dollarCircle32 = "dollarCircle32"
    case dollarCircleFilled12 = "dollarCircleFilled12"
    case dollarCircleFilled16 = "dollarCircleFilled16"
    case dollarCircleFilled20 = "dollarCircleFilled20"
    case dollarCircleFilled24 = "dollarCircleFilled24"
    case dollarCircleFilled32 = "dollarCircleFilled32"
    case dollarSign12 = "dollarSign12"
    case dollarSign16 = "dollarSign16"
    case dollarSign20 = "dollarSign20"
    case dollarSign24 = "dollarSign24"
    case dollarSign32 = "dollarSign32"
    case dollarSignSlashed12 = "dollarSignSlashed12"
    case dollarSignSlashed16 = "dollarSignSlashed16"
    case dollarSignSlashed20 = "dollarSignSlashed20"
    case dollarSignSlashed24 = "dollarSignSlashed24"
    case dollarSignSlashed32 = "dollarSignSlashed32"
    case download12 = "download12"
    case download16 = "download16"
    case download20 = "download20"
    case download24 = "download24"
    case download32 = "download32"
    case downloadDocument12 = "downloadDocument12"
    case downloadDocument16 = "downloadDocument16"
    case downloadDocument20 = "downloadDocument20"
    case downloadDocument24 = "downloadDocument24"
    case downloadDocument32 = "downloadDocument32"
    case downloadDocumentFilled12 = "downloadDocumentFilled12"
    case downloadDocumentFilled16 = "downloadDocumentFilled16"
    case downloadDocumentFilled20 = "downloadDocumentFilled20"
    case downloadDocumentFilled24 = "downloadDocumentFilled24"
    case downloadDocumentFilled32 = "downloadDocumentFilled32"
    case dragHandleHorizontal12 = "dragHandleHorizontal12"
    case dragHandleHorizontal16 = "dragHandleHorizontal16"
    case dragHandleHorizontal20 = "dragHandleHorizontal20"
    case dragHandleHorizontal24 = "dragHandleHorizontal24"
    case dragHandleHorizontal32 = "dragHandleHorizontal32"
    case dragHandleVertical12 = "dragHandleVertical12"
    case dragHandleVertical16 = "dragHandleVertical16"
    case dragHandleVertical20 = "dragHandleVertical20"
    case dragHandleVertical24 = "dragHandleVertical24"
    case dragHandleVertical32 = "dragHandleVertical32"
    case edit12 = "edit12"
    case edit16 = "edit16"
    case edit20 = "edit20"
    case edit24 = "edit24"
    case edit32 = "edit32"
    case editProfile12 = "editProfile12"
    case editProfile16 = "editProfile16"
    case editProfile20 = "editProfile20"
    case editProfile24 = "editProfile24"
    case editProfile32 = "editProfile32"
    case emailOut12 = "emailOut12"
    case emailOut16 = "emailOut16"
    case emailOut20 = "emailOut20"
    case emailOut24 = "emailOut24"
    case emailOut32 = "emailOut32"
    case errorCircle12 = "errorCircle12"
    case errorCircle16 = "errorCircle16"
    case errorCircle20 = "errorCircle20"
    case errorCircle24 = "errorCircle24"
    case errorCircle32 = "errorCircle32"
    case ethereum12 = "ethereum12"
    case ethereum16 = "ethereum16"
    case ethereum20 = "ethereum20"
    case ethereum24 = "ethereum24"
    case ethereum32 = "ethereum32"
    case etherium12 = "etherium12"
    case etherium16 = "etherium16"
    case etherium20 = "etherium20"
    case etherium24 = "etherium24"
    case etherium32 = "etherium32"
    case exclamationCircle12 = "exclamationCircle12"
    case exclamationCircle16 = "exclamationCircle16"
    case exclamationCircle20 = "exclamationCircle20"
    case exclamationCircle24 = "exclamationCircle24"
    case exclamationCircle32 = "exclamationCircle32"
    case exclamationTriangle12 = "exclamationTriangle12"
    case exclamationTriangle16 = "exclamationTriangle16"
    case exclamationTriangle20 = "exclamationTriangle20"
    case exclamationTriangle24 = "exclamationTriangle24"
    case exclamationTriangle32 = "exclamationTriangle32"
    case expand12 = "expand12"
    case expand16 = "expand16"
    case expand20 = "expand20"
    case expand24 = "expand24"
    case expand32 = "expand32"
    case export12 = "export12"
    case export16 = "export16"
    case export20 = "export20"
    case export24 = "export24"
    case export32 = "export32"
    case eye12 = "eye12"
    case eye16 = "eye16"
    case eye20 = "eye20"
    case eye24 = "eye24"
    case eye32 = "eye32"
    case eyeSlashed12 = "eyeSlashed12"
    case eyeSlashed16 = "eyeSlashed16"
    case eyeSlashed20 = "eyeSlashed20"
    case eyeSlashed24 = "eyeSlashed24"
    case eyeSlashed32 = "eyeSlashed32"
    case facebook12 = "facebook12"
    case facebook16 = "facebook16"
    case facebook20 = "facebook20"
    case facebook24 = "facebook24"
    case facebook32 = "facebook32"
    case facebookFilled12 = "facebookFilled12"
    case facebookFilled16 = "facebookFilled16"
    case facebookFilled20 = "facebookFilled20"
    case facebookFilled24 = "facebookFilled24"
    case facebookFilled32 = "facebookFilled32"
    case facebookFilledSize12 = "facebookFilledSize12"
    case facebookFilledSize16 = "facebookFilledSize16"
    case facebookFilledSize20 = "facebookFilledSize20"
    case facebookFilledSize24 = "facebookFilledSize24"
    case facebookFilledSize32 = "facebookFilledSize32"
    case facebookSize12 = "facebookSize12"
    case facebookSize16 = "facebookSize16"
    case facebookSize20 = "facebookSize20"
    case facebookSize24 = "facebookSize24"
    case facebookSize32 = "facebookSize32"
    case fileLines12 = "fileLines12"
    case fileLines16 = "fileLines16"
    case fileLines20 = "fileLines20"
    case fileLines24 = "fileLines24"
    case fileLines32 = "fileLines32"
    case fileLinesSize12 = "fileLinesSize12"
    case fileLinesSize16 = "fileLinesSize16"
    case fileLinesSize20 = "fileLinesSize20"
    case fileLinesSize24 = "fileLinesSize24"
    case fileLinesSize32 = "fileLinesSize32"
    case filterDown12 = "filterDown12"
    case filterDown16 = "filterDown16"
    case filterDown20 = "filterDown20"
    case filterDown24 = "filterDown24"
    case filterDown32 = "filterDown32"
    case flag12 = "flag12"
    case flag16 = "flag16"
    case flag20 = "flag20"
    case flag24 = "flag24"
    case flag32 = "flag32"
    case flagFilled12 = "flagFilled12"
    case flagFilled16 = "flagFilled16"
    case flagFilled20 = "flagFilled20"
    case flagFilled24 = "flagFilled24"
    case flagFilled32 = "flagFilled32"
    case folderAdd12 = "folderAdd12"
    case folderAdd16 = "folderAdd16"
    case folderAdd20 = "folderAdd20"
    case folderAdd24 = "folderAdd24"
    case folderAdd32 = "folderAdd32"
    case fullScreen12 = "fullScreen12"
    case fullScreen16 = "fullScreen16"
    case fullScreen20 = "fullScreen20"
    case fullScreen24 = "fullScreen24"
    case fullScreen32 = "fullScreen32"
    case gamepad12 = "gamepad12"
    case gamepad16 = "gamepad16"
    case gamepad20 = "gamepad20"
    case gamepad24 = "gamepad24"
    case gamepad32 = "gamepad32"
    case gamepadFilled12 = "gamepadFilled12"
    case gamepadFilled16 = "gamepadFilled16"
    case gamepadFilled20 = "gamepadFilled20"
    case gamepadFilled24 = "gamepadFilled24"
    case gamepadFilled32 = "gamepadFilled32"
    case gear12 = "gear12"
    case gear16 = "gear16"
    case gear20 = "gear20"
    case gear24 = "gear24"
    case gear32 = "gear32"
    case gif12 = "gif12"
    case gif16 = "gif16"
    case gif20 = "gif20"
    case gif24 = "gif24"
    case gif32 = "gif32"
    case gifFilled12 = "gifFilled12"
    case gifFilled16 = "gifFilled16"
    case gifFilled20 = "gifFilled20"
    case gifFilled24 = "gifFilled24"
    case gifFilled32 = "gifFilled32"
    case gift12 = "gift12"
    case gift16 = "gift16"
    case gift20 = "gift20"
    case gift24 = "gift24"
    case gift32 = "gift32"
    case globe12 = "globe12"
    case globe16 = "globe16"
    case globe20 = "globe20"
    case globe24 = "globe24"
    case globe32 = "globe32"
    case globeInSquare12 = "globeInSquare12"
    case globeInSquare16 = "globeInSquare16"
    case globeInSquare20 = "globeInSquare20"
    case globeInSquare24 = "globeInSquare24"
    case globeInSquare32 = "globeInSquare32"
    case grid12 = "grid12"
    case grid16 = "grid16"
    case grid20 = "grid20"
    case grid24 = "grid24"
    case grid32 = "grid32"
    case gridAdd12 = "gridAdd12"
    case gridAdd16 = "gridAdd16"
    case gridAdd20 = "gridAdd20"
    case gridAdd24 = "gridAdd24"
    case gridAdd32 = "gridAdd32"
    case handWave12 = "handWave12"
    case handWave16 = "handWave16"
    case handWave20 = "handWave20"
    case handWave24 = "handWave24"
    case handWave32 = "handWave32"
    case happy12 = "happy12"
    case happy16 = "happy16"
    case happy20 = "happy20"
    case happy24 = "happy24"
    case happy32 = "happy32"
    case happyFaceFilled12 = "happyFaceFilled12"
    case happyFaceFilled16 = "happyFaceFilled16"
    case happyFaceFilled20 = "happyFaceFilled20"
    case happyFaceFilled24 = "happyFaceFilled24"
    case happyFaceFilled32 = "happyFaceFilled32"
    case happyFacePlus12 = "happyFacePlus12"
    case happyFacePlus16 = "happyFacePlus16"
    case happyFacePlus20 = "happyFacePlus20"
    case happyFacePlus24 = "happyFacePlus24"
    case happyFacePlus32 = "happyFacePlus32"
    case happyFilled12 = "happyFilled12"
    case happyFilled16 = "happyFilled16"
    case happyFilled20 = "happyFilled20"
    case happyFilled24 = "happyFilled24"
    case happyFilled32 = "happyFilled32"
    case happyPlus12 = "happyPlus12"
    case happyPlus16 = "happyPlus16"
    case happyPlus20 = "happyPlus20"
    case happyPlus24 = "happyPlus24"
    case happyPlus32 = "happyPlus32"
    case hashtag12 = "hashtag12"
    case hashtag16 = "hashtag16"
    case hashtag20 = "hashtag20"
    case hashtag24 = "hashtag24"
    case hashtag32 = "hashtag32"
    case hashtagFilled12 = "hashtagFilled12"
    case hashtagFilled16 = "hashtagFilled16"
    case hashtagFilled20 = "hashtagFilled20"
    case hashtagFilled24 = "hashtagFilled24"
    case hashtagFilled32 = "hashtagFilled32"
    case heading12 = "heading12"
    case heading16 = "heading16"
    case heading20 = "heading20"
    case heading24 = "heading24"
    case heading32 = "heading32"
    case headphones12 = "headphones12"
    case headphones16 = "headphones16"
    case headphones20 = "headphones20"
    case headphones24 = "headphones24"
    case headphones32 = "headphones32"
    case heart12 = "heart12"
    case heart16 = "heart16"
    case heart20 = "heart20"
    case heart24 = "heart24"
    case heart32 = "heart32"
    case heartFilled12 = "heartFilled12"
    case heartFilled16 = "heartFilled16"
    case heartFilled20 = "heartFilled20"
    case heartFilled24 = "heartFilled24"
    case heartFilled32 = "heartFilled32"
    case home12 = "home12"
    case home16 = "home16"
    case home20 = "home20"
    case home24 = "home24"
    case home32 = "home32"
    case hourGlass12 = "hourGlass12"
    case hourGlass16 = "hourGlass16"
    case hourGlass20 = "hourGlass20"
    case hourGlass24 = "hourGlass24"
    case hourGlass32 = "hourGlass32"
    case illuminati12 = "illuminati12"
    case illuminati16 = "illuminati16"
    case illuminati20 = "illuminati20"
    case illuminati24 = "illuminati24"
    case illuminati32 = "illuminati32"
    case illuminatiFilled12 = "illuminatiFilled12"
    case illuminatiFilled16 = "illuminatiFilled16"
    case illuminatiFilled20 = "illuminatiFilled20"
    case illuminatiFilled24 = "illuminatiFilled24"
    case illuminatiFilled32 = "illuminatiFilled32"
    case inbox12 = "inbox12"
    case inbox16 = "inbox16"
    case inbox20 = "inbox20"
    case inbox24 = "inbox24"
    case inbox32 = "inbox32"
    case info12 = "info12"
    case info16 = "info16"
    case info20 = "info20"
    case info24 = "info24"
    case info32 = "info32"
    case infoCircle12 = "infoCircle12"
    case infoCircle16 = "infoCircle16"
    case infoCircle20 = "infoCircle20"
    case infoCircle24 = "infoCircle24"
    case infoCircle32 = "infoCircle32"
    case infoCircleFilled12 = "infoCircleFilled12"
    case infoCircleFilled16 = "infoCircleFilled16"
    case infoCircleFilled20 = "infoCircleFilled20"
    case infoCircleFilled24 = "infoCircleFilled24"
    case infoCircleFilled32 = "infoCircleFilled32"
    case infoFilled12 = "infoFilled12"
    case infoFilled16 = "infoFilled16"
    case infoFilled20 = "infoFilled20"
    case infoFilled24 = "infoFilled24"
    case infoFilled32 = "infoFilled32"
    case infoOutline12 = "infoOutline12"
    case infoOutline16 = "infoOutline16"
    case infoOutline20 = "infoOutline20"
    case infoOutline24 = "infoOutline24"
    case infoOutline32 = "infoOutline32"
    case infoSize12 = "infoSize12"
    case infoSize16 = "infoSize16"
    case infoSize20 = "infoSize20"
    case infoSize24 = "infoSize24"
    case infoSize32 = "infoSize32"
    case infoSquare12 = "infoSquare12"
    case infoSquare16 = "infoSquare16"
    case infoSquare20 = "infoSquare20"
    case infoSquare24 = "infoSquare24"
    case infoSquare32 = "infoSquare32"
    case information12 = "information12"
    case information16 = "information16"
    case information20 = "information20"
    case information24 = "information24"
    case information32 = "information32"
    case instagram12 = "instagram12"
    case instagram16 = "instagram16"
    case instagram20 = "instagram20"
    case instagram24 = "instagram24"
    case instagram32 = "instagram32"
    case instagramSize12 = "instagramSize12"
    case instagramSize16 = "instagramSize16"
    case instagramSize20 = "instagramSize20"
    case instagramSize24 = "instagramSize24"
    case instagramSize32 = "instagramSize32"
    case italic12 = "italic12"
    case italic16 = "italic16"
    case italic20 = "italic20"
    case italic24 = "italic24"
    case italic32 = "italic32"
    case item12 = "item12"
    case item20 = "item20"
    case item24 = "item24"
    case item32 = "item32"
    case k12 = "k12"
    case k16 = "k16"
    case k20 = "k20"
    case k24 = "k24"
    case k32 = "k32"
    case leaf12 = "leaf12"
    case leaf16 = "leaf16"
    case leaf20 = "leaf20"
    case leaf24 = "leaf24"
    case leaf32 = "leaf32"
    case leaveReview12 = "leaveReview12"
    case leaveReview16 = "leaveReview16"
    case leaveReview20 = "leaveReview20"
    case leaveReview24 = "leaveReview24"
    case leaveReview32 = "leaveReview32"
    case lightbulb12 = "lightbulb12"
    case lightbulb16 = "lightbulb16"
    case lightbulb20 = "lightbulb20"
    case lightbulb24 = "lightbulb24"
    case lightbulb32 = "lightbulb32"
    case lightsOff12 = "lightsOff12"
    case lightsOff16 = "lightsOff16"
    case lightsOff20 = "lightsOff20"
    case lightsOff24 = "lightsOff24"
    case lightsOff32 = "lightsOff32"
    case lightsOn12 = "lightsOn12"
    case lightsOn16 = "lightsOn16"
    case lightsOn20 = "lightsOn20"
    case lightsOn24 = "lightsOn24"
    case lightsOn32 = "lightsOn32"
    case lilstNumber12 = "lilstNumber12"
    case lilstNumber16 = "lilstNumber16"
    case lilstNumber20 = "lilstNumber20"
    case lilstNumber24 = "lilstNumber24"
    case lilstNumber32 = "lilstNumber32"
    case link12 = "link12"
    case link16 = "link16"
    case link20 = "link20"
    case link24 = "link24"
    case link32 = "link32"
    case linkAdd12 = "linkAdd12"
    case linkAdd16 = "linkAdd16"
    case linkAdd20 = "linkAdd20"
    case linkAdd24 = "linkAdd24"
    case linkAdd32 = "linkAdd32"
    case linkSlash12 = "linkSlash12"
    case linkSlash16 = "linkSlash16"
    case linkSlash20 = "linkSlash20"
    case linkSlash24 = "linkSlash24"
    case linkSlash32 = "linkSlash32"
    case linkedin12 = "linkedin12"
    case linkedin16 = "linkedin16"
    case linkedin20 = "linkedin20"
    case linkedin24 = "linkedin24"
    case linkedin32 = "linkedin32"
    case list12 = "list12"
    case list16 = "list16"
    case list20 = "list20"
    case list24 = "list24"
    case list32 = "list32"
    case listBullet12 = "listBullet12"
    case listBullet16 = "listBullet16"
    case listBullet20 = "listBullet20"
    case listBullet24 = "listBullet24"
    case listBullet32 = "listBullet32"
    case listCheck12 = "listCheck12"
    case listCheck16 = "listCheck16"
    case listCheck20 = "listCheck20"
    case listCheck24 = "listCheck24"
    case listCheck32 = "listCheck32"
    case listNumber12 = "listNumber12"
    case listNumber16 = "listNumber16"
    case listNumber20 = "listNumber20"
    case listNumber24 = "listNumber24"
    case listNumber32 = "listNumber32"
    case locationPin12 = "locationPin12"
    case locationPin16 = "locationPin16"
    case locationPin20 = "locationPin20"
    case locationPin24 = "locationPin24"
    case locationPin32 = "locationPin32"
    case lock12 = "lock12"
    case lock16 = "lock16"
    case lock20 = "lock20"
    case lock24 = "lock24"
    case lock32 = "lock32"
    case lockFilled12 = "lockFilled12"
    case lockFilled16 = "lockFilled16"
    case lockFilled20 = "lockFilled20"
    case lockFilled24 = "lockFilled24"
    case lockFilled32 = "lockFilled32"
    case lockOpen12 = "lockOpen12"
    case lockOpen16 = "lockOpen16"
    case lockOpen20 = "lockOpen20"
    case lockOpen24 = "lockOpen24"
    case lockOpen32 = "lockOpen32"
    case logout12 = "logout12"
    case logout16 = "logout16"
    case logout20 = "logout20"
    case logout24 = "logout24"
    case logout32 = "logout32"
    case magnifyingGlass12 = "magnifyingGlass12"
    case magnifyingGlass16 = "magnifyingGlass16"
    case magnifyingGlass20 = "magnifyingGlass20"
    case magnifyingGlass24 = "magnifyingGlass24"
    case magnifyingGlass32 = "magnifyingGlass32"
    case mail12 = "mail12"
    case mail16 = "mail16"
    case mail20 = "mail20"
    case mail24 = "mail24"
    case mail32 = "mail32"
    case mailFilled12 = "mailFilled12"
    case mailFilled16 = "mailFilled16"
    case mailFilled20 = "mailFilled20"
    case mailFilled24 = "mailFilled24"
    case mailFilled32 = "mailFilled32"
    case mailOut12 = "mailOut12"
    case mailOut16 = "mailOut16"
    case mailOut20 = "mailOut20"
    case mailOut24 = "mailOut24"
    case mailOut32 = "mailOut32"
    case markAsRead12 = "markAsRead12"
    case markAsRead16 = "markAsRead16"
    case markAsRead20 = "markAsRead20"
    case markAsRead24 = "markAsRead24"
    case markAsRead32 = "markAsRead32"
    case markAsUnread12 = "markAsUnread12"
    case markAsUnread16 = "markAsUnread16"
    case markAsUnread20 = "markAsUnread20"
    case markAsUnread24 = "markAsUnread24"
    case markAsUnread32 = "markAsUnread32"
    case medalCheck12 = "medalCheck12"
    case medalCheck16 = "medalCheck16"
    case medalCheck20 = "medalCheck20"
    case medalCheck24 = "medalCheck24"
    case medalCheck32 = "medalCheck32"
    case medalCheckSize12 = "medalCheckSize12"
    case medalCheckSize16 = "medalCheckSize16"
    case medalCheckSize20 = "medalCheckSize20"
    case medalCheckSize24 = "medalCheckSize24"
    case medalCheckSize32 = "medalCheckSize32"
    case medalCheckmark12 = "medalCheckmark12"
    case medalCheckmark16 = "medalCheckmark16"
    case medalCheckmark20 = "medalCheckmark20"
    case medalCheckmark24 = "medalCheckmark24"
    case medalCheckmark32 = "medalCheckmark32"
    case megaphone12 = "megaphone12"
    case megaphone16 = "megaphone16"
    case megaphone20 = "megaphone20"
    case megaphone24 = "megaphone24"
    case megaphone32 = "megaphone32"
    case mentionFilled12 = "mentionFilled12"
    case mentionFilled16 = "mentionFilled16"
    case mentionFilled20 = "mentionFilled20"
    case mentionFilled24 = "mentionFilled24"
    case mentionFilled32 = "mentionFilled32"
    case menu12 = "menu12"
    case menu16 = "menu16"
    case menu20 = "menu20"
    case menu24 = "menu24"
    case menu32 = "menu32"
    case merch12 = "merch12"
    case merch16 = "merch16"
    case merch20 = "merch20"
    case merch24 = "merch24"
    case merch32 = "merch32"
    case message12 = "message12"
    case message16 = "message16"
    case message20 = "message20"
    case message24 = "message24"
    case message32 = "message32"
    case messageEdit12 = "messageEdit12"
    case messageEdit16 = "messageEdit16"
    case messageEdit20 = "messageEdit20"
    case messageEdit24 = "messageEdit24"
    case messageEdit32 = "messageEdit32"
    case messageFilled12 = "messageFilled12"
    case messageFilled16 = "messageFilled16"
    case messageFilled20 = "messageFilled20"
    case messageFilled24 = "messageFilled24"
    case messageFilled32 = "messageFilled32"
    case messageNotification12 = "messageNotification12"
    case messageNotification16 = "messageNotification16"
    case messageNotification20 = "messageNotification20"
    case messageNotification24 = "messageNotification24"
    case messageNotification32 = "messageNotification32"
    case messageSlashed12 = "messageSlashed12"
    case messageSlashed16 = "messageSlashed16"
    case messageSlashed20 = "messageSlashed20"
    case messageSlashed24 = "messageSlashed24"
    case messageSlashed32 = "messageSlashed32"
    case messages12 = "messages12"
    case messages16 = "messages16"
    case messages20 = "messages20"
    case messages24 = "messages24"
    case messages32 = "messages32"
    case messagesQuestion12 = "messagesQuestion12"
    case messagesQuestion16 = "messagesQuestion16"
    case messagesQuestion20 = "messagesQuestion20"
    case messagesQuestion24 = "messagesQuestion24"
    case messagesQuestion32 = "messagesQuestion32"
    case micOff12 = "micOff12"
    case micOff16 = "micOff16"
    case micOff20 = "micOff20"
    case micOff24 = "micOff24"
    case micOff32 = "micOff32"
    case micOn12 = "micOn12"
    case micOn16 = "micOn16"
    case micOn20 = "micOn20"
    case micOn24 = "micOn24"
    case micOn32 = "micOn32"
    case microphone12 = "microphone12"
    case microphone16 = "microphone16"
    case microphone20 = "microphone20"
    case microphone24 = "microphone24"
    case microphone32 = "microphone32"
    case microphoneOff12 = "microphoneOff12"
    case microphoneOff16 = "microphoneOff16"
    case microphoneOff20 = "microphoneOff20"
    case microphoneOff24 = "microphoneOff24"
    case microphoneOff32 = "microphoneOff32"
    case minimize12 = "minimize12"
    case minimize16 = "minimize16"
    case minimize20 = "minimize20"
    case minimize24 = "minimize24"
    case minimize32 = "minimize32"
    case mobilePhone12 = "mobilePhone12"
    case mobilePhone16 = "mobilePhone16"
    case mobilePhone20 = "mobilePhone20"
    case mobilePhone24 = "mobilePhone24"
    case mobilePhone32 = "mobilePhone32"
    case mobilePhoneSize12 = "mobilePhoneSize12"
    case mobilePhoneSize16 = "mobilePhoneSize16"
    case mobilePhoneSize20 = "mobilePhoneSize20"
    case mobilePhoneSize24 = "mobilePhoneSize24"
    case mobilePhoneSize32 = "mobilePhoneSize32"
    case monitor12 = "monitor12"
    case monitor16 = "monitor16"
    case monitor20 = "monitor20"
    case monitor24 = "monitor24"
    case monitor32 = "monitor32"
    case monitorSize12 = "monitorSize12"
    case monitorSize16 = "monitorSize16"
    case monitorSize20 = "monitorSize20"
    case monitorSize24 = "monitorSize24"
    case monitorSize32 = "monitorSize32"
    case moon12 = "moon12"
    case moon16 = "moon16"
    case moon20 = "moon20"
    case moon24 = "moon24"
    case moon32 = "moon32"
    case moonFilled12 = "moonFilled12"
    case moonFilled16 = "moonFilled16"
    case moonFilled20 = "moonFilled20"
    case moonFilled24 = "moonFilled24"
    case moonFilled32 = "moonFilled32"
    case moonSize12 = "moonSize12"
    case moonSize16 = "moonSize16"
    case moonSize20 = "moonSize20"
    case moonSize24 = "moonSize24"
    case moonSize32 = "moonSize32"
    case notificationBellCrossed12 = "notificationBellCrossed12"
    case notificationBellCrossed16 = "notificationBellCrossed16"
    case notificationBellCrossed20 = "notificationBellCrossed20"
    case notificationBellCrossed24 = "notificationBellCrossed24"
    case notificationBellCrossed32 = "notificationBellCrossed32"
    case palette12 = "palette12"
    case palette16 = "palette16"
    case palette20 = "palette20"
    case palette24 = "palette24"
    case palette32 = "palette32"
    case paperAirplaneFilled12 = "paperAirplaneFilled12"
    case paperAirplaneFilled16 = "paperAirplaneFilled16"
    case paperAirplaneFilled20 = "paperAirplaneFilled20"
    case paperAirplaneFilled24 = "paperAirplaneFilled24"
    case paperAirplaneFilled32 = "paperAirplaneFilled32"
    case paperAirplaneFilledUp12 = "paperAirplaneFilledUp12"
    case paperAirplaneFilledUp16 = "paperAirplaneFilledUp16"
    case paperAirplaneFilledUp20 = "paperAirplaneFilledUp20"
    case paperAirplaneFilledUp24 = "paperAirplaneFilledUp24"
    case paperAirplaneFilledUp32 = "paperAirplaneFilledUp32"
    case paperAirplaneUpFilled12 = "paperAirplaneUpFilled12"
    case paperAirplaneUpFilled16 = "paperAirplaneUpFilled16"
    case paperAirplaneUpFilled20 = "paperAirplaneUpFilled20"
    case paperAirplaneUpFilled24 = "paperAirplaneUpFilled24"
    case paperAirplaneUpFilled32 = "paperAirplaneUpFilled32"
    case parachute12 = "parachute12"
    case parachute16 = "parachute16"
    case parachute20 = "parachute20"
    case parachute24 = "parachute24"
    case parachute32 = "parachute32"
    case participants12 = "participants12"
    case participants16 = "participants16"
    case participants20 = "participants20"
    case participants24 = "participants24"
    case participants32 = "participants32"
    case pause12 = "pause12"
    case pause16 = "pause16"
    case pause20 = "pause20"
    case pause24 = "pause24"
    case pause32 = "pause32"
    case pauseCircle12 = "pauseCircle12"
    case pauseCircle16 = "pauseCircle16"
    case pauseCircle20 = "pauseCircle20"
    case pauseCircle24 = "pauseCircle24"
    case pauseCircle32 = "pauseCircle32"
    case pauseFilled12 = "pauseFilled12"
    case pauseFilled16 = "pauseFilled16"
    case pauseFilled20 = "pauseFilled20"
    case pauseFilled24 = "pauseFilled24"
    case pauseFilled32 = "pauseFilled32"
    case paypal12 = "paypal12"
    case paypal16 = "paypal16"
    case paypal20 = "paypal20"
    case paypal24 = "paypal24"
    case paypal32 = "paypal32"
    case pencil12 = "pencil12"
    case pencil16 = "pencil16"
    case pencil20 = "pencil20"
    case pencil24 = "pencil24"
    case pencil32 = "pencil32"
    case people12 = "people12"
    case people16 = "people16"
    case people20 = "people20"
    case people212 = "people212"
    case people216 = "people216"
    case people220 = "people220"
    case people224 = "people224"
    case people232 = "people232"
    case people24 = "people24"
    case people32 = "people32"
    case peoplePlus12 = "peoplePlus12"
    case peoplePlus16 = "peoplePlus16"
    case peoplePlus20 = "peoplePlus20"
    case peoplePlus24 = "peoplePlus24"
    case peoplePlus32 = "peoplePlus32"
    case percentage12 = "percentage12"
    case percentage16 = "percentage16"
    case percentage20 = "percentage20"
    case percentage24 = "percentage24"
    case percentage32 = "percentage32"
    case photo12 = "photo12"
    case photo16 = "photo16"
    case photo20 = "photo20"
    case photo24 = "photo24"
    case photo32 = "photo32"
    case photoFilled12 = "photoFilled12"
    case photoFilled16 = "photoFilled16"
    case photoFilled20 = "photoFilled20"
    case photoFilled24 = "photoFilled24"
    case photoFilled32 = "photoFilled32"
    case photos12 = "photos12"
    case photos16 = "photos16"
    case photos20 = "photos20"
    case photos24 = "photos24"
    case photos32 = "photos32"
    case pictureInPicture12 = "pictureInPicture12"
    case pictureInPicture16 = "pictureInPicture16"
    case pictureInPicture20 = "pictureInPicture20"
    case pictureInPicture24 = "pictureInPicture24"
    case pictureInPicture32 = "pictureInPicture32"
    case pin12 = "pin12"
    case pin16 = "pin16"
    case pin20 = "pin20"
    case pin24 = "pin24"
    case pin32 = "pin32"
    case pinFilled12 = "pinFilled12"
    case pinFilled16 = "pinFilled16"
    case pinFilled20 = "pinFilled20"
    case pinFilled24 = "pinFilled24"
    case pinFilled32 = "pinFilled32"
    case pinTilted12 = "pinTilted12"
    case pinTilted16 = "pinTilted16"
    case pinTilted20 = "pinTilted20"
    case pinTilted24 = "pinTilted24"
    case pinTilted32 = "pinTilted32"
    case pinTiltedFilled12 = "pinTiltedFilled12"
    case pinTiltedFilled16 = "pinTiltedFilled16"
    case pinTiltedFilled20 = "pinTiltedFilled20"
    case pinTiltedFilled24 = "pinTiltedFilled24"
    case pinTiltedFilled32 = "pinTiltedFilled32"
    case plane12 = "plane12"
    case plane16 = "plane16"
    case plane20 = "plane20"
    case plane24 = "plane24"
    case plane32 = "plane32"
    case play12 = "play12"
    case play16 = "play16"
    case play20 = "play20"
    case play24 = "play24"
    case play32 = "play32"
    case playCircle12 = "playCircle12"
    case playCircle16 = "playCircle16"
    case playCircle20 = "playCircle20"
    case playCircle24 = "playCircle24"
    case playCircle32 = "playCircle32"
    case playFilled12 = "playFilled12"
    case playFilled16 = "playFilled16"
    case playFilled20 = "playFilled20"
    case playFilled24 = "playFilled24"
    case playFilled32 = "playFilled32"
    case plus12 = "plus12"
    case plus16 = "plus16"
    case plus20 = "plus20"
    case plus24 = "plus24"
    case plus32 = "plus32"
    case plusCircle12 = "plusCircle12"
    case plusCircle16 = "plusCircle16"
    case plusCircle20 = "plusCircle20"
    case plusCircle24 = "plusCircle24"
    case plusCircle32 = "plusCircle32"
    case plusRectangle12 = "plusRectangle12"
    case plusRectangle16 = "plusRectangle16"
    case plusRectangle20 = "plusRectangle20"
    case plusRectangle24 = "plusRectangle24"
    case plusRectangle32 = "plusRectangle32"
    case profile12 = "profile12"
    case profile16 = "profile16"
    case profile20 = "profile20"
    case profile24 = "profile24"
    case profile32 = "profile32"
    case profileCircle12 = "profileCircle12"
    case profileCircle16 = "profileCircle16"
    case profileCircle20 = "profileCircle20"
    case profileCircle24 = "profileCircle24"
    case profileCircle32 = "profileCircle32"
    case profileFilled12 = "profileFilled12"
    case profileFilled16 = "profileFilled16"
    case profileFilled20 = "profileFilled20"
    case profileFilled24 = "profileFilled24"
    case profileFilled32 = "profileFilled32"
    case profileX12 = "profileX12"
    case profileX16 = "profileX16"
    case profileX20 = "profileX20"
    case profileX24 = "profileX24"
    case profileX32 = "profileX32"
    case questionCircle12 = "questionCircle12"
    case questionCircle16 = "questionCircle16"
    case questionCircle20 = "questionCircle20"
    case questionCircle24 = "questionCircle24"
    case questionCircle32 = "questionCircle32"
    case quoteLeft12 = "quoteLeft12"
    case quoteLeft16 = "quoteLeft16"
    case quoteLeft20 = "quoteLeft20"
    case quoteLeft24 = "quoteLeft24"
    case quoteLeft32 = "quoteLeft32"
    case quoteRight12 = "quoteRight12"
    case quoteRight16 = "quoteRight16"
    case quoteRight20 = "quoteRight20"
    case quoteRight24 = "quoteRight24"
    case quoteRight32 = "quoteRight32"
    case raiseHand12 = "raiseHand12"
    case raiseHand16 = "raiseHand16"
    case raiseHand20 = "raiseHand20"
    case raiseHand24 = "raiseHand24"
    case raiseHand32 = "raiseHand32"
    case receipt12 = "receipt12"
    case receipt16 = "receipt16"
    case receipt20 = "receipt20"
    case receipt24 = "receipt24"
    case receipt32 = "receipt32"
    case receptionBell12 = "receptionBell12"
    case receptionBell16 = "receptionBell16"
    case receptionBell20 = "receptionBell20"
    case receptionBell24 = "receptionBell24"
    case receptionBell32 = "receptionBell32"
    case receptionBellFilled12 = "receptionBellFilled12"
    case receptionBellFilled16 = "receptionBellFilled16"
    case receptionBellFilled20 = "receptionBellFilled20"
    case receptionBellFilled24 = "receptionBellFilled24"
    case receptionBellFilled32 = "receptionBellFilled32"
    case rectangleStack12 = "rectangleStack12"
    case rectangleStack16 = "rectangleStack16"
    case rectangleStack20 = "rectangleStack20"
    case rectangleStack24 = "rectangleStack24"
    case rectangleStack32 = "rectangleStack32"
    case refresh12 = "refresh12"
    case refresh16 = "refresh16"
    case refresh20 = "refresh20"
    case refresh24 = "refresh24"
    case refresh32 = "refresh32"
    case refund12 = "refund12"
    case refund16 = "refund16"
    case refund20 = "refund20"
    case refund24 = "refund24"
    case refund32 = "refund32"
    case reply12 = "reply12"
    case reply16 = "reply16"
    case reply20 = "reply20"
    case reply24 = "reply24"
    case reply32 = "reply32"
    case replyFilled12 = "replyFilled12"
    case replyFilled16 = "replyFilled16"
    case replyFilled20 = "replyFilled20"
    case replyFilled24 = "replyFilled24"
    case replyFilled32 = "replyFilled32"
    case rewardDiamond12 = "rewardDiamond12"
    case rewardDiamond16 = "rewardDiamond16"
    case rewardDiamond20 = "rewardDiamond20"
    case rewardDiamond24 = "rewardDiamond24"
    case rewardDiamond32 = "rewardDiamond32"
    case rocket12 = "rocket12"
    case rocket16 = "rocket16"
    case rocket20 = "rocket20"
    case rocket24 = "rocket24"
    case rocket32 = "rocket32"
    case rotate12 = "rotate12"
    case rotate16 = "rotate16"
    case rotate20 = "rotate20"
    case rotate24 = "rotate24"
    case rotate32 = "rotate32"
    case rotateCard12 = "rotateCard12"
    case rotateCard16 = "rotateCard16"
    case rotateCard20 = "rotateCard20"
    case rotateCard24 = "rotateCard24"
    case rotateCard32 = "rotateCard32"
    case rotateLeft12 = "rotateLeft12"
    case rotateLeft16 = "rotateLeft16"
    case rotateLeft20 = "rotateLeft20"
    case rotateLeft24 = "rotateLeft24"
    case rotateLeft32 = "rotateLeft32"
    case rotateLeftSize12 = "rotateLeftSize12"
    case rotateLeftSize16 = "rotateLeftSize16"
    case rotateLeftSize20 = "rotateLeftSize20"
    case rotateLeftSize24 = "rotateLeftSize24"
    case rotateLeftSize32 = "rotateLeftSize32"
    case rotateRight12 = "rotateRight12"
    case rotateRight16 = "rotateRight16"
    case rotateRight20 = "rotateRight20"
    case rotateRight24 = "rotateRight24"
    case rotateRight32 = "rotateRight32"
    case rotateRightSize12 = "rotateRightSize12"
    case rotateRightSize16 = "rotateRightSize16"
    case rotateRightSize20 = "rotateRightSize20"
    case rotateRightSize24 = "rotateRightSize24"
    case rotateRightSize32 = "rotateRightSize32"
    case roundedArrowAngleLeft12 = "roundedArrowAngleLeft12"
    case roundedArrowAngleLeft16 = "roundedArrowAngleLeft16"
    case roundedArrowAngleLeft20 = "roundedArrowAngleLeft20"
    case roundedArrowAngleLeft24 = "roundedArrowAngleLeft24"
    case roundedArrowAngleLeft32 = "roundedArrowAngleLeft32"
    case roundedArrowAngleRight12 = "roundedArrowAngleRight12"
    case roundedArrowAngleRight16 = "roundedArrowAngleRight16"
    case roundedArrowAngleRight20 = "roundedArrowAngleRight20"
    case roundedArrowAngleRight24 = "roundedArrowAngleRight24"
    case roundedArrowAngleRight32 = "roundedArrowAngleRight32"
    case sad12 = "sad12"
    case sad16 = "sad16"
    case sad20 = "sad20"
    case sad24 = "sad24"
    case sad32 = "sad32"
    case sadFace12 = "sadFace12"
    case sadFace16 = "sadFace16"
    case sadFace20 = "sadFace20"
    case sadFace24 = "sadFace24"
    case sadFace32 = "sadFace32"
    case sadFaceFilled12 = "sadFaceFilled12"
    case sadFaceFilled16 = "sadFaceFilled16"
    case sadFaceFilled20 = "sadFaceFilled20"
    case sadFaceFilled24 = "sadFaceFilled24"
    case sadFaceFilled32 = "sadFaceFilled32"
    case sadFilled12 = "sadFilled12"
    case sadFilled16 = "sadFilled16"
    case sadFilled20 = "sadFilled20"
    case sadFilled24 = "sadFilled24"
    case sadFilled32 = "sadFilled32"
    case sealCheckmark12 = "sealCheckmark12"
    case sealCheckmark16 = "sealCheckmark16"
    case sealCheckmark20 = "sealCheckmark20"
    case sealCheckmark24 = "sealCheckmark24"
    case sealCheckmark32 = "sealCheckmark32"
    case sealCheckmarkFilled12 = "sealCheckmarkFilled12"
    case sealCheckmarkFilled16 = "sealCheckmarkFilled16"
    case sealCheckmarkFilled20 = "sealCheckmarkFilled20"
    case sealCheckmarkFilled24 = "sealCheckmarkFilled24"
    case sealCheckmarkFilled32 = "sealCheckmarkFilled32"
    case sealExclamation12 = "sealExclamation12"
    case sealExclamation16 = "sealExclamation16"
    case sealExclamation20 = "sealExclamation20"
    case sealExclamation24 = "sealExclamation24"
    case sealExclamation32 = "sealExclamation32"
    case sealExclamationFilled12 = "sealExclamationFilled12"
    case sealExclamationFilled16 = "sealExclamationFilled16"
    case sealExclamationFilled20 = "sealExclamationFilled20"
    case sealExclamationFilled24 = "sealExclamationFilled24"
    case sealExclamationFilled32 = "sealExclamationFilled32"
    case shareNodes12 = "shareNodes12"
    case shareNodes16 = "shareNodes16"
    case shareNodes20 = "shareNodes20"
    case shareNodes24 = "shareNodes24"
    case shareNodes32 = "shareNodes32"
    case shareScreen12 = "shareScreen12"
    case shareScreen16 = "shareScreen16"
    case shareScreen20 = "shareScreen20"
    case shareScreen24 = "shareScreen24"
    case shareScreen32 = "shareScreen32"
    case shieldCheckmark12 = "shieldCheckmark12"
    case shieldCheckmark16 = "shieldCheckmark16"
    case shieldCheckmark20 = "shieldCheckmark20"
    case shieldCheckmark24 = "shieldCheckmark24"
    case shieldCheckmark32 = "shieldCheckmark32"
    case shieldHalf12 = "shieldHalf12"
    case shieldHalf16 = "shieldHalf16"
    case shieldHalf20 = "shieldHalf20"
    case shieldHalf24 = "shieldHalf24"
    case shieldHalf32 = "shieldHalf32"
    case shop12 = "shop12"
    case shop16 = "shop16"
    case shop20 = "shop20"
    case shop24 = "shop24"
    case shop32 = "shop32"
    case shoppingBag12 = "shoppingBag12"
    case shoppingBag16 = "shoppingBag16"
    case shoppingBag20 = "shoppingBag20"
    case shoppingBag24 = "shoppingBag24"
    case shoppingBag32 = "shoppingBag32"
    case sparkle12 = "sparkle12"
    case sparkle16 = "sparkle16"
    case sparkle20 = "sparkle20"
    case sparkle24 = "sparkle24"
    case sparkle32 = "sparkle32"
    case sparkleFilled12 = "sparkleFilled12"
    case sparkleFilled16 = "sparkleFilled16"
    case sparkleFilled20 = "sparkleFilled20"
    case sparkleFilled24 = "sparkleFilled24"
    case sparkleFilled32 = "sparkleFilled32"
    case sparkleMultiple12 = "sparkleMultiple12"
    case sparkleMultiple16 = "sparkleMultiple16"
    case sparkleMultiple20 = "sparkleMultiple20"
    case sparkleMultiple24 = "sparkleMultiple24"
    case sparkleMultiple32 = "sparkleMultiple32"
    case sparkleRectangle12 = "sparkleRectangle12"
    case sparkleRectangle16 = "sparkleRectangle16"
    case sparkleRectangle20 = "sparkleRectangle20"
    case sparkleRectangle24 = "sparkleRectangle24"
    case sparkleRectangle32 = "sparkleRectangle32"
    case sparkles12 = "sparkles12"
    case sparkles16 = "sparkles16"
    case sparkles20 = "sparkles20"
    case sparkles24 = "sparkles24"
    case sparkles32 = "sparkles32"
    case speaker12 = "speaker12"
    case speaker16 = "speaker16"
    case speaker20 = "speaker20"
    case speaker24 = "speaker24"
    case speaker32 = "speaker32"
    case split12 = "split12"
    case split16 = "split16"
    case split20 = "split20"
    case split24 = "split24"
    case split32 = "split32"
    case squareAdd12 = "squareAdd12"
    case squareAdd16 = "squareAdd16"
    case squareAdd20 = "squareAdd20"
    case squareAdd24 = "squareAdd24"
    case squareAdd32 = "squareAdd32"
    case star12 = "star12"
    case star16 = "star16"
    case star20 = "star20"
    case star24 = "star24"
    case star32 = "star32"
    case starFilled12 = "starFilled12"
    case starFilled16 = "starFilled16"
    case starFilled20 = "starFilled20"
    case starFilled24 = "starFilled24"
    case starFilled32 = "starFilled32"
    case starHalf12 = "starHalf12"
    case starHalf16 = "starHalf16"
    case starHalf20 = "starHalf20"
    case starHalf24 = "starHalf24"
    case starHalf32 = "starHalf32"
    case stats12 = "stats12"
    case stats16 = "stats16"
    case stats20 = "stats20"
    case stats24 = "stats24"
    case stats32 = "stats32"
    case sticker12 = "sticker12"
    case sticker16 = "sticker16"
    case sticker20 = "sticker20"
    case sticker24 = "sticker24"
    case sticker32 = "sticker32"
    case stickerFilled12 = "stickerFilled12"
    case stickerFilled16 = "stickerFilled16"
    case stickerFilled20 = "stickerFilled20"
    case stickerFilled24 = "stickerFilled24"
    case stickerFilled32 = "stickerFilled32"
    case store16 = "store16"
    case store20 = "store20"
    case storefrontItem12 = "storefrontItem12"
    case storefrontItem16 = "storefrontItem16"
    case storefrontItem20 = "storefrontItem20"
    case storefrontItem24 = "storefrontItem24"
    case storefrontItem32 = "storefrontItem32"
    case strikethrough12 = "strikethrough12"
    case strikethrough16 = "strikethrough16"
    case strikethrough20 = "strikethrough20"
    case strikethrough24 = "strikethrough24"
    case strikethrough32 = "strikethrough32"
    case subtract12 = "subtract12"
    case subtract16 = "subtract16"
    case subtract20 = "subtract20"
    case subtract24 = "subtract24"
    case subtract32 = "subtract32"
    case sun12 = "sun12"
    case sun16 = "sun16"
    case sun20 = "sun20"
    case sun24 = "sun24"
    case sun32 = "sun32"
    case sunSize12 = "sunSize12"
    case sunSize16 = "sunSize16"
    case sunSize20 = "sunSize20"
    case sunSize24 = "sunSize24"
    case sunSize32 = "sunSize32"
    case swords12 = "swords12"
    case swords16 = "swords16"
    case swords20 = "swords20"
    case swords24 = "swords24"
    case swords32 = "swords32"
    case tShirt12 = "tShirt12"
    case tShirt16 = "tShirt16"
    case tShirt20 = "tShirt20"
    case tShirt24 = "tShirt24"
    case tShirt32 = "tShirt32"
    case tShirtFilled12 = "tShirtFilled12"
    case tShirtFilled16 = "tShirtFilled16"
    case tShirtFilled20 = "tShirtFilled20"
    case tShirtFilled24 = "tShirtFilled24"
    case tShirtFilled32 = "tShirtFilled32"
    case table12 = "table12"
    case table16 = "table16"
    case table20 = "table20"
    case table24 = "table24"
    case table32 = "table32"
    case tag12 = "tag12"
    case tag16 = "tag16"
    case tag20 = "tag20"
    case tag24 = "tag24"
    case tag32 = "tag32"
    case telegram12 = "telegram12"
    case telegram16 = "telegram16"
    case telegram20 = "telegram20"
    case telegram24 = "telegram24"
    case telegram32 = "telegram32"
    case telegramFilled12 = "telegramFilled12"
    case telegramFilled16 = "telegramFilled16"
    case telegramFilled20 = "telegramFilled20"
    case telegramFilled24 = "telegramFilled24"
    case telegramFilled32 = "telegramFilled32"
    case telegramFilledSize12 = "telegramFilledSize12"
    case telegramFilledSize16 = "telegramFilledSize16"
    case telegramFilledSize20 = "telegramFilledSize20"
    case telegramFilledSize24 = "telegramFilledSize24"
    case telegramFilledSize32 = "telegramFilledSize32"
    case telegramSize12 = "telegramSize12"
    case telegramSize16 = "telegramSize16"
    case telegramSize20 = "telegramSize20"
    case telegramSize24 = "telegramSize24"
    case telegramSize32 = "telegramSize32"
    case telephone12 = "telephone12"
    case telephone16 = "telephone16"
    case telephone20 = "telephone20"
    case telephone24 = "telephone24"
    case telephone32 = "telephone32"
    case threeDotsCircle12 = "threeDotsCircle12"
    case threeDotsCircle16 = "threeDotsCircle16"
    case threeDotsCircle20 = "threeDotsCircle20"
    case threeDotsCircle24 = "threeDotsCircle24"
    case threeDotsCircle32 = "threeDotsCircle32"
    case threeDotsCircleSize12 = "threeDotsCircleSize12"
    case threeDotsCircleSize16 = "threeDotsCircleSize16"
    case threeDotsCircleSize20 = "threeDotsCircleSize20"
    case threeDotsCircleSize24 = "threeDotsCircleSize24"
    case threeDotsCircleSize32 = "threeDotsCircleSize32"
    case threeDotsHorizontal12 = "threeDotsHorizontal12"
    case threeDotsHorizontal16 = "threeDotsHorizontal16"
    case threeDotsHorizontal20 = "threeDotsHorizontal20"
    case threeDotsHorizontal24 = "threeDotsHorizontal24"
    case threeDotsHorizontal32 = "threeDotsHorizontal32"
    case threeDotsVertical12 = "threeDotsVertical12"
    case threeDotsVertical16 = "threeDotsVertical16"
    case threeDotsVertical20 = "threeDotsVertical20"
    case threeDotsVertical24 = "threeDotsVertical24"
    case threeDotsVertical32 = "threeDotsVertical32"
    case thumbDown12 = "thumbDown12"
    case thumbDown16 = "thumbDown16"
    case thumbDown20 = "thumbDown20"
    case thumbDown24 = "thumbDown24"
    case thumbDown32 = "thumbDown32"
    case thumbDownFilled12 = "thumbDownFilled12"
    case thumbDownFilled16 = "thumbDownFilled16"
    case thumbDownFilled20 = "thumbDownFilled20"
    case thumbDownFilled24 = "thumbDownFilled24"
    case thumbDownFilled32 = "thumbDownFilled32"
    case thumbUp12 = "thumbUp12"
    case thumbUp16 = "thumbUp16"
    case thumbUp20 = "thumbUp20"
    case thumbUp24 = "thumbUp24"
    case thumbUp32 = "thumbUp32"
    case thumbUpFilled12 = "thumbUpFilled12"
    case thumbUpFilled16 = "thumbUpFilled16"
    case thumbUpFilled20 = "thumbUpFilled20"
    case thumbUpFilled24 = "thumbUpFilled24"
    case thumbUpFilled32 = "thumbUpFilled32"
    case tikTok12 = "tikTok12"
    case tikTok16 = "tikTok16"
    case tikTokFilled12 = "tikTokFilled12"
    case tikTokFilled24 = "tikTokFilled24"
    case tikTokFilled32 = "tikTokFilled32"
    case tiktok20 = "tiktok20"
    case tiktok24 = "tiktok24"
    case tiktok32 = "tiktok32"
    case tiktokFilled16 = "tiktokFilled16"
    case tiktokFilled20 = "tiktokFilled20"
    case tiktokFilledSize12 = "tiktokFilledSize12"
    case tiktokFilledSize16 = "tiktokFilledSize16"
    case tiktokFilledSize20 = "tiktokFilledSize20"
    case tiktokFilledSize24 = "tiktokFilledSize24"
    case tiktokFilledSize32 = "tiktokFilledSize32"
    case tiktokSize12 = "tiktokSize12"
    case tiktokSize16 = "tiktokSize16"
    case tiktokSize20 = "tiktokSize20"
    case tiktokSize24 = "tiktokSize24"
    case tiktokSize32 = "tiktokSize32"
    case timeSkipLeft12 = "timeSkipLeft12"
    case timeSkipLeft16 = "timeSkipLeft16"
    case timeSkipLeft20 = "timeSkipLeft20"
    case timeSkipLeft24 = "timeSkipLeft24"
    case timeSkipLeft32 = "timeSkipLeft32"
    case timeSkipRight12 = "timeSkipRight12"
    case timeSkipRight16 = "timeSkipRight16"
    case timeSkipRight20 = "timeSkipRight20"
    case timeSkipRight24 = "timeSkipRight24"
    case timeSkipRight32 = "timeSkipRight32"
    case tradingView20 = "tradingView20"
    case tradingView24 = "tradingView24"
    case tradingView32 = "tradingView32"
    case tradingview12 = "tradingview12"
    case tradingview16 = "tradingview16"
    case trash12 = "trash12"
    case trash16 = "trash16"
    case trash20 = "trash20"
    case trash24 = "trash24"
    case trash32 = "trash32"
    case trashFilled12 = "trashFilled12"
    case trashFilled16 = "trashFilled16"
    case trashFilled20 = "trashFilled20"
    case trashFilled24 = "trashFilled24"
    case trashFilled32 = "trashFilled32"
    case trashSolid12 = "trashSolid12"
    case trashSolid16 = "trashSolid16"
    case trashSolid20 = "trashSolid20"
    case trashSolid24 = "trashSolid24"
    case trashSolid32 = "trashSolid32"
    case trophy12 = "trophy12"
    case trophy16 = "trophy16"
    case trophy20 = "trophy20"
    case trophy24 = "trophy24"
    case trophy32 = "trophy32"
    case truck12 = "truck12"
    case truck16 = "truck16"
    case truck20 = "truck20"
    case truck24 = "truck24"
    case truck32 = "truck32"
    case twitch12 = "twitch12"
    case twitch16 = "twitch16"
    case twitch20 = "twitch20"
    case twitch24 = "twitch24"
    case twitch32 = "twitch32"
    case twitter12 = "twitter12"
    case twitter16 = "twitter16"
    case twitter20 = "twitter20"
    case twitter24 = "twitter24"
    case twitter32 = "twitter32"
    case twitterFilled12 = "twitterFilled12"
    case twitterFilled16 = "twitterFilled16"
    case twitterFilled20 = "twitterFilled20"
    case twitterFilled24 = "twitterFilled24"
    case twitterFilled32 = "twitterFilled32"
    case twitterFilledSize12 = "twitterFilledSize12"
    case twitterFilledSize16 = "twitterFilledSize16"
    case twitterFilledSize20 = "twitterFilledSize20"
    case twitterFilledSize24 = "twitterFilledSize24"
    case twitterFilledSize32 = "twitterFilledSize32"
    case twitterSize12 = "twitterSize12"
    case twitterSize16 = "twitterSize16"
    case twitterSize20 = "twitterSize20"
    case twitterSize24 = "twitterSize24"
    case twitterSize32 = "twitterSize32"
    case typography12 = "typography12"
    case typography16 = "typography16"
    case typography20 = "typography20"
    case typography24 = "typography24"
    case typography32 = "typography32"
    case underline12 = "underline12"
    case underline16 = "underline16"
    case underline20 = "underline20"
    case underline24 = "underline24"
    case underline32 = "underline32"
    case unpin12 = "unpin12"
    case unpin16 = "unpin16"
    case unpin20 = "unpin20"
    case unpin24 = "unpin24"
    case unpin32 = "unpin32"
    case unpinFilled12 = "unpinFilled12"
    case unpinFilled16 = "unpinFilled16"
    case unpinFilled20 = "unpinFilled20"
    case unpinFilled24 = "unpinFilled24"
    case unpinFilled32 = "unpinFilled32"
    case upinTilted12 = "upinTilted12"
    case upinTilted16 = "upinTilted16"
    case upinTilted20 = "upinTilted20"
    case upinTilted24 = "upinTilted24"
    case upinTilted32 = "upinTilted32"
    case upinTiltedFilled12 = "upinTiltedFilled12"
    case upinTiltedFilled16 = "upinTiltedFilled16"
    case upinTiltedFilled20 = "upinTiltedFilled20"
    case upinTiltedFilled24 = "upinTiltedFilled24"
    case upinTiltedFilled32 = "upinTiltedFilled32"
    case upload12 = "upload12"
    case upload16 = "upload16"
    case upload20 = "upload20"
    case upload24 = "upload24"
    case upload32 = "upload32"
    case usd12 = "usd12"
    case usd16 = "usd16"
    case usd20 = "usd20"
    case usd24 = "usd24"
    case usd32 = "usd32"
    case user12 = "user12"
    case user16 = "user16"
    case user20 = "user20"
    case user24 = "user24"
    case user32 = "user32"
    case verifiedCheck12 = "verifiedCheck12"
    case verifiedCheck16 = "verifiedCheck16"
    case verifiedCheck20 = "verifiedCheck20"
    case verifiedCheck24 = "verifiedCheck24"
    case verifiedCheck32 = "verifiedCheck32"
    case videoFilled12 = "videoFilled12"
    case videoFilled16 = "videoFilled16"
    case videoFilled20 = "videoFilled20"
    case videoFilled24 = "videoFilled24"
    case videoFilled32 = "videoFilled32"
    case volumeHigh12 = "volumeHigh12"
    case volumeHigh16 = "volumeHigh16"
    case volumeHigh20 = "volumeHigh20"
    case volumeHigh24 = "volumeHigh24"
    case volumeHigh32 = "volumeHigh32"
    case volumeLow12 = "volumeLow12"
    case volumeLow16 = "volumeLow16"
    case volumeLow20 = "volumeLow20"
    case volumeLow24 = "volumeLow24"
    case volumeLow32 = "volumeLow32"
    case volumeOff12 = "volumeOff12"
    case volumeOff16 = "volumeOff16"
    case volumeOff20 = "volumeOff20"
    case volumeOff24 = "volumeOff24"
    case volumeOff32 = "volumeOff32"
    case wallet12 = "wallet12"
    case wallet16 = "wallet16"
    case wallet20 = "wallet20"
    case wallet24 = "wallet24"
    case wallet32 = "wallet32"
    case waveform12 = "waveform12"
    case waveform16 = "waveform16"
    case waveform20 = "waveform20"
    case waveform24 = "waveform24"
    case waveform32 = "waveform32"
    case webcamOff12 = "webcamOff12"
    case webcamOff16 = "webcamOff16"
    case webcamOff20 = "webcamOff20"
    case webcamOff24 = "webcamOff24"
    case webcamOff32 = "webcamOff32"
    case webcamOn12 = "webcamOn12"
    case webcamOn16 = "webcamOn16"
    case webcamOn20 = "webcamOn20"
    case webcamOn24 = "webcamOn24"
    case webcamOn32 = "webcamOn32"
    case whopLogo12 = "whopLogo12"
    case whopLogo16 = "whopLogo16"
    case whopLogo20 = "whopLogo20"
    case whopLogo24 = "whopLogo24"
    case whopLogo32 = "whopLogo32"
    case xCircle12 = "xCircle12"
    case xCircle16 = "xCircle16"
    case xCircle20 = "xCircle20"
    case xCircle24 = "xCircle24"
    case xCircle32 = "xCircle32"
    case xCircleFilled12 = "xCircleFilled12"
    case xCircleFilled16 = "xCircleFilled16"
    case xCircleFilled20 = "xCircleFilled20"
    case xCircleFilled24 = "xCircleFilled24"
    case xCircleFilled32 = "xCircleFilled32"
    case xCircleSize12 = "xCircleSize12"
    case xCircleSize16 = "xCircleSize16"
    case xCircleSize20 = "xCircleSize20"
    case xCircleSize24 = "xCircleSize24"
    case xCircleSize32 = "xCircleSize32"
    case xDotCom12 = "xDotCom12"
    case xDotCom16 = "xDotCom16"
    case xDotCom20 = "xDotCom20"
    case xDotCom24 = "xDotCom24"
    case xDotCom32 = "xDotCom32"
    case xDotComSize12 = "xDotComSize12"
    case xDotComSize16 = "xDotComSize16"
    case xDotComSize20 = "xDotComSize20"
    case xDotComSize24 = "xDotComSize24"
    case xDotComSize32 = "xDotComSize32"
    case xMark12 = "xMark12"
    case xMark16 = "xMark16"
    case xMark20 = "xMark20"
    case xMark24 = "xMark24"
    case xMark32 = "xMark32"
    case youTube12 = "youTube12"
    case youTube16 = "youTube16"
    case youTubeFilled12 = "youTubeFilled12"
    case youTubeFilled16 = "youTubeFilled16"
    case youtube20 = "youtube20"
    case youtube24 = "youtube24"
    case youtube32 = "youtube32"
    case youtubeFilled20 = "youtubeFilled20"
    case youtubeFilled24 = "youtubeFilled24"
    case youtubeFilled32 = "youtubeFilled32"
    case youtubeFilledSize12 = "youtubeFilledSize12"
    case youtubeFilledSize16 = "youtubeFilledSize16"
    case youtubeFilledSize20 = "youtubeFilledSize20"
    case youtubeFilledSize24 = "youtubeFilledSize24"
    case youtubeFilledSize32 = "youtubeFilledSize32"
    case youtubeSize12 = "youtubeSize12"
    case youtubeSize16 = "youtubeSize16"
    case youtubeSize20 = "youtubeSize20"
    case youtubeSize24 = "youtubeSize24"
    case youtubeSize32 = "youtubeSize32"
}

public extension Image {
    init(_ icon: FrostedIcon) {
        self.init(icon.rawValue, bundle: .module)
    }
}

public extension FrostedIconSet {

    static let addUser = FrostedIconSet(
        size12: .addUser12,
        size16: .addUser16,
        size20: .addUser20,
        size24: .addUser24,
        size32: .addUser32
    )

    static let alignCenter = FrostedIconSet(
        size12: .alignCenter12,
        size16: .alignCenter16,
        size20: .alignCenter20,
        size24: .alignCenter24,
        size32: .alignCenter32
    )

    static let alignLeft = FrostedIconSet(
        size12: .alignLeft12,
        size16: .alignLeft16,
        size20: .alignLeft20,
        size24: .alignLeft24,
        size32: .alignLeft32
    )

    static let alignRight = FrostedIconSet(
        size12: .alignRight12,
        size16: .alignRight16,
        size20: .alignRight20,
        size24: .alignRight24,
        size32: .alignRight32
    )

    static let apps = FrostedIconSet(
        size12: .apps12,
        size16: .apps16,
        size20: .apps20,
        size24: .apps24,
        size32: .apps32
    )

    static let arrowDown = FrostedIconSet(
        size12: .arrowDown12,
        size16: .arrowDown16,
        size20: .arrowDown20,
        size24: .arrowDown24,
        size32: .arrowDown32
    )

    static let arrowDownAngleLeft = FrostedIconSet(
        size12: .arrowDownAngleLeft12,
        size16: .arrowDownAngleLeft16,
        size20: .arrowDownAngleLeft20,
        size24: .arrowDownAngleLeft24,
        size32: .arrowDownAngleLeft32
    )

    static let arrowDownAngleRight = FrostedIconSet(
        size12: .arrowDownAngleRight12,
        size16: .arrowDownAngleRight16,
        size20: .arrowDownAngleRight20,
        size24: .arrowDownAngleRight24,
        size32: .arrowDownAngleRight32
    )

    static let arrowDownLeft = FrostedIconSet(
        size12: .arrowDownLeft12,
        size16: .arrowDownLeft16,
        size20: .arrowDownLeft20,
        size24: .arrowDownLeft24,
        size32: .arrowDownLeft32
    )

    static let arrowDownRight = FrostedIconSet(
        size12: .arrowDownRight12,
        size16: .arrowDownRight16,
        size20: .arrowDownRight20,
        size24: .arrowDownRight24,
        size32: .arrowDownRight32
    )

    static let arrowDownToLine = FrostedIconSet(
        size12: .arrowDownToLine12,
        size16: .arrowDownToLine16,
        size20: .arrowDownToLine20,
        size24: .arrowDownToLine24,
        size32: .arrowDownToLine32
    )

    static let arrowDownToLineSize = FrostedIconSet(
        size12: .arrowDownToLineSize12,
        size16: .arrowDownToLineSize16,
        size20: .arrowDownToLineSize20,
        size24: .arrowDownToLineSize24,
        size32: .arrowDownToLineSize32
    )

    static let arrowFatDown = FrostedIconSet(
        size12: .arrowFatDown12,
        size16: .arrowFatDown16,
        size20: .arrowFatDown20,
        size24: .arrowFatDown24,
        size32: .arrowFatDown32
    )

    static let arrowFatDownFilled = FrostedIconSet(
        size12: .arrowFatDownFilled12,
        size16: .arrowFatDownFilled16,
        size20: .arrowFatDownFilled20,
        size24: .arrowFatDownFilled24,
        size32: .arrowFatDownFilled32
    )

    static let arrowFatUp = FrostedIconSet(
        size12: .arrowFatUp12,
        size16: .arrowFatUp16,
        size20: .arrowFatUp20,
        size24: .arrowFatUp24,
        size32: .arrowFatUp32
    )

    static let arrowFatUpFilled = FrostedIconSet(
        size12: .arrowFatUpFilled12,
        size16: .arrowFatUpFilled16,
        size20: .arrowFatUpFilled20,
        size24: .arrowFatUpFilled24,
        size32: .arrowFatUpFilled32
    )

    static let arrowLeft = FrostedIconSet(
        size12: .arrowLeft12,
        size16: .arrowLeft16,
        size20: .arrowLeft20,
        size24: .arrowLeft24,
        size32: .arrowLeft32
    )

    static let arrowRight = FrostedIconSet(
        size12: .arrowRight12,
        size16: .arrowRight16,
        size20: .arrowRight20,
        size24: .arrowRight24,
        size32: .arrowRight32
    )

    static let arrowUp = FrostedIconSet(
        size12: .arrowUp12,
        size16: .arrowUp16,
        size20: .arrowUp20,
        size24: .arrowUp24,
        size32: .arrowUp32
    )

    static let arrowUpFromBracket = FrostedIconSet(
        size12: .arrowUpFromBracket12,
        size16: .arrowUpFromBracket16,
        size20: .arrowUpFromBracket20,
        size24: .arrowUpFromBracket24,
        size32: .arrowUpFromBracket32
    )

    static let arrowUpLeft = FrostedIconSet(
        size12: .arrowUpLeft12,
        size16: .arrowUpLeft16,
        size20: .arrowUpLeft20,
        size24: .arrowUpLeft24,
        size32: .arrowUpLeft32
    )

    static let arrowUpRight = FrostedIconSet(
        size12: .arrowUpRight12,
        size16: .arrowUpRight16,
        size20: .arrowUpRight20,
        size24: .arrowUpRight24,
        size32: .arrowUpRight32
    )

    static let arrowUpRightFromBracket = FrostedIconSet(
        size12: .arrowUpRightFromBracket12,
        size16: .arrowUpRightFromBracket16,
        size20: .arrowUpRightFromBracket20,
        size24: .arrowUpRightFromBracket24,
        size32: .arrowUpRightFromBracket32
    )

    static let arrowUpRightFromSquare = FrostedIconSet(
        size12: .arrowUpRightFromSquare12,
        size16: .arrowUpRightFromSquare16,
        size20: .arrowUpRightFromSquare20,
        size24: .arrowUpRightFromSquare24,
        size32: .arrowUpRightFromSquare32
    )

    static let arrowUpRightFromSquareFlush = FrostedIconSet(
        size12: .arrowUpRightFromSquareFlush12,
        size16: .arrowUpRightFromSquareFlush16,
        size20: .arrowUpRightFromSquareFlush20,
        size24: .arrowUpRightFromSquareFlush24,
        size32: .arrowUpRightFromSquareFlush32
    )

    static let atom = FrostedIconSet(
        size12: .atom12,
        size16: .atom16,
        size20: .atom20,
        size24: .atom24,
        size32: .atom32
    )

    static let ban = FrostedIconSet(
        size12: .ban12,
        size16: .ban16,
        size20: .ban20,
        size24: .ban24,
        size32: .ban32
    )

    static let bank = FrostedIconSet(
        size12: .bank12,
        size16: .bank16,
        size20: .bank20,
        size24: .bank24,
        size32: .bank32
    )

    static let bannerPhoto = FrostedIconSet(
        size12: .bannerPhoto12,
        size16: .bannerPhoto16,
        size20: .bannerPhoto20,
        size24: .bannerPhoto24,
        size32: .bannerPhoto32
    )

    static let barChart = FrostedIconSet(
        size12: .barChart12,
        size16: .barChart16,
        size20: .barChart20,
        size24: .barChart24,
        size32: .barChart32
    )

    static let barsFilter = FrostedIconSet(
        size12: .barsFilter12,
        size16: .barsFilter16,
        size20: .barsFilter20,
        size24: .barsFilter24,
        size32: .barsFilter32
    )

    static let beaker = FrostedIconSet(
        size12: .beaker12,
        size16: .beaker16,
        size20: .beaker20,
        size24: .beaker24,
        size32: .beaker32
    )

    static let beakerFilled = FrostedIconSet(
        size12: .beakerFilled12,
        size16: .beakerFilled16,
        size20: .beakerFilled20,
        size24: .beakerFilled24,
        size32: .beakerFilled32
    )

    static let bell = FrostedIconSet(
        size12: .bell12,
        size16: .bell16,
        size20: .bell20,
        size24: .bell24,
        size32: .bell32
    )

    static let bellSlash = FrostedIconSet(
        size12: .bellSlash12,
        size16: .bellSlash16,
        size20: .bellSlash20,
        size24: .bellSlash24,
        size32: .bellSlash32
    )

    static let bitcoin = FrostedIconSet(
        size12: .bitcoin12,
        size16: .bitcoin16,
        size20: .bitcoin20,
        size24: .bitcoin24,
        size32: .bitcoin32
    )

    static let bold = FrostedIconSet(
        size12: .bold12,
        size16: .bold16,
        size20: .bold20,
        size24: .bold24,
        size32: .bold32
    )

    static let book = FrostedIconSet(
        size12: .book12,
        size16: .book16,
        size20: .book20,
        size24: .book24,
        size32: .book32
    )

    static let browser = FrostedIconSet(
        size12: .browser12,
        size16: .browser16,
        size20: .browser20,
        size24: .browser24,
        size32: .browser32
    )

    static let bulb = FrostedIconSet(
        size12: .bulb12,
        size16: .bulb16,
        size20: .bulb20,
        size24: .bulb24,
        size32: .bulb32
    )

    static let burger = FrostedIconSet(
        size12: .burger12,
        size16: .burger16,
        size20: .burger20,
        size24: .burger24,
        size32: .burger32
    )

    static let calendar = FrostedIconSet(
        size12: .calendar12,
        size16: .calendar16,
        size20: .calendar20,
        size24: .calendar24,
        size32: .calendar32
    )

    static let calendarPlus = FrostedIconSet(
        size12: .calendarPlus12,
        size16: .calendarPlus16,
        size20: .calendarPlus20,
        size24: .calendarPlus24,
        size32: .calendarPlus32
    )

    static let calendarPlusSize = FrostedIconSet(
        size12: .calendarPlusSize12,
        size16: .calendarPlusSize16,
        size20: .calendarPlusSize20,
        size24: .calendarPlusSize24,
        size32: .calendarPlusSize32
    )

    static let calendarX = FrostedIconSet(
        size12: .calendarX12,
        size16: .calendarX16,
        size20: .calendarX20,
        size24: .calendarX24,
        size32: .calendarX32
    )

    static let calendarXSize = FrostedIconSet(
        size12: .calendarXSize12,
        size16: .calendarXSize16,
        size20: .calendarXSize20,
        size24: .calendarXSize24,
        size32: .calendarXSize32
    )

    static let camera = FrostedIconSet(
        size12: .camera12,
        size16: .camera16,
        size20: .camera20,
        size24: .camera24,
        size32: .camera32
    )

    static let cameraAdd = FrostedIconSet(
        size12: .cameraAdd12,
        size16: .cameraAdd16,
        size20: .cameraAdd20,
        size24: .cameraAdd24,
        size32: .cameraAdd32
    )

    static let cameraAddFilled = FrostedIconSet(
        size12: .cameraAddFilled12,
        size16: .cameraAddFilled16,
        size20: .cameraAddFilled20,
        size24: .cameraAddFilled24,
        size32: .cameraAddFilled32
    )

    static let cameraFilled = FrostedIconSet(
        size12: .cameraFilled12,
        size16: .cameraFilled16,
        size20: .cameraFilled20,
        size24: .cameraFilled24,
        size32: .cameraFilled32
    )

    static let cartRemove = FrostedIconSet(
        size12: .cartRemove12,
        size16: .cartRemove16,
        size20: .cartRemove20,
        size24: .cartRemove24,
        size32: .cartRemove32
    )

    static let chat = FrostedIconSet(
        size12: .chat12,
        size16: .chat16,
        size20: .chat20,
        size24: .chat24,
        size32: .chat32
    )

    static let checklist = FrostedIconSet(
        size12: .checklist12,
        size16: .checklist16,
        size20: .checklist20,
        size24: .checklist24,
        size32: .checklist32
    )

    static let checkmark = FrostedIconSet(
        size12: .checkmark12,
        size16: .checkmark16,
        size20: .checkmark20,
        size24: .checkmark24,
        size32: .checkmark32
    )

    static let checkmarkCircle = FrostedIconSet(
        size12: .checkmarkCircle12,
        size16: .checkmarkCircle16,
        size20: .checkmarkCircle20,
        size24: .checkmarkCircle24,
        size32: .checkmarkCircle32
    )

    static let checkmarkCircleFilled = FrostedIconSet(
        size12: .checkmarkCircleFilled12,
        size16: .checkmarkCircleFilled16,
        size20: .checkmarkCircleFilled20,
        size24: .checkmarkCircleFilled24,
        size32: .checkmarkCircleFilled32
    )

    static let checkmarkShield = FrostedIconSet(
        size12: .checkmarkShield12,
        size16: .checkmarkShield16,
        size20: .checkmarkShield20,
        size24: .checkmarkShield24,
        size32: .checkmarkShield32
    )

    static let chevronDown = FrostedIconSet(
        size12: .chevronDown12,
        size16: .chevronDown16,
        size20: .chevronDown20,
        size24: .chevronDown24,
        size32: .chevronDown32
    )

    static let chevronLeft = FrostedIconSet(
        size12: .chevronLeft12,
        size16: .chevronLeft16,
        size20: .chevronLeft20,
        size24: .chevronLeft24,
        size32: .chevronLeft32
    )

    static let chevronLeftToLineInBox = FrostedIconSet(
        size12: .chevronLeftToLineInBox12,
        size16: .chevronLeftToLineInBox16,
        size20: .chevronLeftToLineInBox20,
        size24: .chevronLeftToLineInBox24,
        size32: .chevronLeftToLineInBox32
    )

    static let chevronLeftToLineInBoxSize = FrostedIconSet(
        size12: .chevronLeftToLineInBoxSize12,
        size16: .chevronLeftToLineInBoxSize16,
        size20: .chevronLeftToLineInBoxSize20,
        size24: .chevronLeftToLineInBoxSize24,
        size32: .chevronLeftToLineInBoxSize32
    )

    static let chevronRight = FrostedIconSet(
        size12: .chevronRight12,
        size16: .chevronRight16,
        size20: .chevronRight20,
        size24: .chevronRight24,
        size32: .chevronRight32
    )

    static let chevronUp = FrostedIconSet(
        size12: .chevronUp12,
        size16: .chevronUp16,
        size20: .chevronUp20,
        size24: .chevronUp24,
        size32: .chevronUp32
    )

    static let clipboard = FrostedIconSet(
        size12: .clipboard12,
        size16: .clipboard16,
        size20: .clipboard20,
        size24: .clipboard24,
        size32: .clipboard32
    )

    static let clipboardSize = FrostedIconSet(
        size12: .clipboardSize12,
        size16: .clipboardSize16,
        size20: .clipboardSize20,
        size24: .clipboardSize24,
        size32: .clipboardSize32
    )

    static let clock = FrostedIconSet(
        size12: .clock12,
        size16: .clock16,
        size20: .clock20,
        size24: .clock24,
        size32: .clock32
    )

    static let clockFilled = FrostedIconSet(
        size12: .clockFilled12,
        size16: .clockFilled16,
        size20: .clockFilled20,
        size24: .clockFilled24,
        size32: .clockFilled32
    )

    static let closedCaptions = FrostedIconSet(
        size12: .closedCaptions12,
        size16: .closedCaptions16,
        size20: .closedCaptions20,
        size24: .closedCaptions24,
        size32: .closedCaptions32
    )

    static let code = FrostedIconSet(
        size12: .code12,
        size16: .code16,
        size20: .code20,
        size24: .code24,
        size32: .code32
    )

    static let codeblock = FrostedIconSet(
        size12: .codeblock12,
        size16: .codeblock16,
        size20: .codeblock20,
        size24: .codeblock24,
        size32: .codeblock32
    )

    static let coinbase = FrostedIconSet(
        size12: .coinbase12,
        size16: .coinbase16,
        size20: .coinbase20,
        size24: .coinbase24,
        size32: .coinbase32
    )

    static let collapseSidebar = FrostedIconSet(
        size12: .collapseSidebar12,
        size16: .collapseSidebar16,
        size20: .collapseSidebar20,
        size24: .collapseSidebar24,
        size32: .collapseSidebar32
    )

    static let collapseSidebarFilled = FrostedIconSet(
        size12: .collapseSidebarFilled12,
        size16: .collapseSidebarFilled16,
        size20: .collapseSidebarFilled20,
        size24: .collapseSidebarFilled24,
        size32: .collapseSidebarFilled32
    )

    static let command = FrostedIconSet(
        size12: .command12,
        size16: .command16,
        size20: .command20,
        size24: .command24,
        size32: .command32
    )

    static let compass = FrostedIconSet(
        size12: .compass12,
        size16: .compass16,
        size20: .compass20,
        size24: .compass24,
        size32: .compass32
    )

    static let compassFilled = FrostedIconSet(
        size12: .compassFilled12,
        size16: .compassFilled16,
        size20: .compassFilled20,
        size24: .compassFilled24,
        size32: .compassFilled32
    )

    static let component19 = FrostedIconSet(
        size12: .component1912,
        size16: .component1916,
        size20: .component1920,
        size24: .component1924,
        size32: .component1932
    )

    static let compress = FrostedIconSet(
        size12: .compress12,
        size16: .compress16,
        size20: .compress20,
        size24: .compress24,
        size32: .compress32
    )

    static let converge = FrostedIconSet(
        size12: .converge12,
        size16: .converge16,
        size20: .converge20,
        size24: .converge24,
        size32: .converge32
    )

    static let copy = FrostedIconSet(
        size12: .copy12,
        size16: .copy16,
        size20: .copy20,
        size24: .copy24,
        size32: .copy32
    )

    static let couponActive = FrostedIconSet(
        size12: .couponActive12,
        size16: .couponActive16,
        size20: .couponActive20,
        size24: .couponActive24,
        size32: .couponActive32
    )

    static let couponExpired = FrostedIconSet(
        size12: .couponExpired12,
        size16: .couponExpired16,
        size20: .couponExpired20,
        size24: .couponExpired24,
        size32: .couponExpired32
    )

    static let creditCard = FrostedIconSet(
        size12: .creditCard12,
        size16: .creditCard16,
        size20: .creditCard20,
        size24: .creditCard24,
        size32: .creditCard32
    )

    static let creditCardFilled = FrostedIconSet(
        size12: .creditCardFilled12,
        size16: .creditCardFilled16,
        size20: .creditCardFilled20,
        size24: .creditCardFilled24,
        size32: .creditCardFilled32
    )

    static let cube = FrostedIconSet(
        size12: .cube12,
        size16: .cube16,
        size20: .cube20,
        size24: .cube24,
        size32: .cube32
    )

    static let cubeDisconnected = FrostedIconSet(
        size12: .cubeDisconnected12,
        size16: .cubeDisconnected16,
        size20: .cubeDisconnected20,
        size24: .cubeDisconnected24,
        size32: .cubeDisconnected32
    )

    static let cubeFilled = FrostedIconSet(
        size12: .cubeFilled12,
        size16: .cubeFilled16,
        size20: .cubeFilled20,
        size24: .cubeFilled24,
        size32: .cubeFilled32
    )

    static let cubeSize = FrostedIconSet(
        size12: .cubeSize12,
        size16: .cubeSize16,
        size20: .cubeSize20,
        size24: .cubeSize24,
        size32: .cubeSize32
    )

    static let cursor = FrostedIconSet(
        size12: .cursor12,
        size16: .cursor16,
        size20: .cursor20,
        size24: .cursor24,
        size32: .cursor32
    )

    static let cursorFilled = FrostedIconSet(
        size12: .cursorFilled12,
        size16: .cursorFilled16,
        size20: .cursorFilled20,
        size24: .cursorFilled24,
        size32: .cursorFilled32
    )

    static let cursorOutline = FrostedIconSet(
        size12: .cursorOutline12,
        size16: .cursorOutline16,
        size20: .cursorOutline20,
        size24: .cursorOutline24,
        size32: .cursorOutline32
    )

    static let dashboard = FrostedIconSet(
        size12: .dashboard12,
        size16: .dashboard16,
        size20: .dashboard20,
        size24: .dashboard24,
        size32: .dashboard32
    )

    static let dashedCircle = FrostedIconSet(
        size12: .dashedCircle12,
        size16: .dashedCircle16,
        size20: .dashedCircle20,
        size24: .dashedCircle24,
        size32: .dashedCircle32
    )

    static let dice = FrostedIconSet(
        size12: .dice12,
        size16: .dice16,
        size20: .dice20,
        size24: .dice24,
        size32: .dice32
    )

    static let diceSize = FrostedIconSet(
        size12: .diceSize12,
        size16: .diceSize16,
        size20: .diceSize20,
        size24: .diceSize24,
        size32: .diceSize32
    )

    static let discord = FrostedIconSet(
        size12: .discord12,
        size16: .discord16,
        size20: .discord20,
        size24: .discord24,
        size32: .discord32
    )

    static let discordFilled = FrostedIconSet(
        size12: .discordFilled12,
        size16: .discordFilled16,
        size20: .discordFilled20,
        size24: .discordFilled24,
        size32: .discordFilled32
    )

    static let discordFilledSize = FrostedIconSet(
        size12: .discordFilledSize12,
        size16: .discordFilledSize16,
        size20: .discordFilledSize20,
        size24: .discordFilledSize24,
        size32: .discordFilledSize32
    )

    static let discordSize = FrostedIconSet(
        size12: .discordSize12,
        size16: .discordSize16,
        size20: .discordSize20,
        size24: .discordSize24,
        size32: .discordSize32
    )

    static let dna = FrostedIconSet(
        size12: .dna12,
        size16: .dna16,
        size20: .dna20,
        size24: .dna24,
        size32: .dna32
    )

    static let document = FrostedIconSet(
        size12: .document12,
        size16: .document16,
        size20: .document20,
        size24: .document24,
        size32: .document32
    )

    static let documentLines = FrostedIconSet(
        size12: .documentLines12,
        size16: .documentLines16,
        size20: .documentLines20,
        size24: .documentLines24,
        size32: .documentLines32
    )

    static let documentPlus = FrostedIconSet(
        size12: .documentPlus12,
        size16: .documentPlus16,
        size20: .documentPlus20,
        size24: .documentPlus24,
        size32: .documentPlus32
    )

    static let dollarCircle = FrostedIconSet(
        size12: .dollarCircle12,
        size16: .dollarCircle16,
        size20: .dollarCircle20,
        size24: .dollarCircle24,
        size32: .dollarCircle32
    )

    static let dollarCircleFilled = FrostedIconSet(
        size12: .dollarCircleFilled12,
        size16: .dollarCircleFilled16,
        size20: .dollarCircleFilled20,
        size24: .dollarCircleFilled24,
        size32: .dollarCircleFilled32
    )

    static let dollarSign = FrostedIconSet(
        size12: .dollarSign12,
        size16: .dollarSign16,
        size20: .dollarSign20,
        size24: .dollarSign24,
        size32: .dollarSign32
    )

    static let dollarSignSlashed = FrostedIconSet(
        size12: .dollarSignSlashed12,
        size16: .dollarSignSlashed16,
        size20: .dollarSignSlashed20,
        size24: .dollarSignSlashed24,
        size32: .dollarSignSlashed32
    )

    static let download = FrostedIconSet(
        size12: .download12,
        size16: .download16,
        size20: .download20,
        size24: .download24,
        size32: .download32
    )

    static let downloadDocument = FrostedIconSet(
        size12: .downloadDocument12,
        size16: .downloadDocument16,
        size20: .downloadDocument20,
        size24: .downloadDocument24,
        size32: .downloadDocument32
    )

    static let downloadDocumentFilled = FrostedIconSet(
        size12: .downloadDocumentFilled12,
        size16: .downloadDocumentFilled16,
        size20: .downloadDocumentFilled20,
        size24: .downloadDocumentFilled24,
        size32: .downloadDocumentFilled32
    )

    static let dragHandleHorizontal = FrostedIconSet(
        size12: .dragHandleHorizontal12,
        size16: .dragHandleHorizontal16,
        size20: .dragHandleHorizontal20,
        size24: .dragHandleHorizontal24,
        size32: .dragHandleHorizontal32
    )

    static let dragHandleVertical = FrostedIconSet(
        size12: .dragHandleVertical12,
        size16: .dragHandleVertical16,
        size20: .dragHandleVertical20,
        size24: .dragHandleVertical24,
        size32: .dragHandleVertical32
    )

    static let edit = FrostedIconSet(
        size12: .edit12,
        size16: .edit16,
        size20: .edit20,
        size24: .edit24,
        size32: .edit32
    )

    static let editProfile = FrostedIconSet(
        size12: .editProfile12,
        size16: .editProfile16,
        size20: .editProfile20,
        size24: .editProfile24,
        size32: .editProfile32
    )

    static let emailOut = FrostedIconSet(
        size12: .emailOut12,
        size16: .emailOut16,
        size20: .emailOut20,
        size24: .emailOut24,
        size32: .emailOut32
    )

    static let errorCircle = FrostedIconSet(
        size12: .errorCircle12,
        size16: .errorCircle16,
        size20: .errorCircle20,
        size24: .errorCircle24,
        size32: .errorCircle32
    )

    static let ethereum = FrostedIconSet(
        size12: .ethereum12,
        size16: .ethereum16,
        size20: .ethereum20,
        size24: .ethereum24,
        size32: .ethereum32
    )

    static let etherium = FrostedIconSet(
        size12: .etherium12,
        size16: .etherium16,
        size20: .etherium20,
        size24: .etherium24,
        size32: .etherium32
    )

    static let exclamationCircle = FrostedIconSet(
        size12: .exclamationCircle12,
        size16: .exclamationCircle16,
        size20: .exclamationCircle20,
        size24: .exclamationCircle24,
        size32: .exclamationCircle32
    )

    static let exclamationTriangle = FrostedIconSet(
        size12: .exclamationTriangle12,
        size16: .exclamationTriangle16,
        size20: .exclamationTriangle20,
        size24: .exclamationTriangle24,
        size32: .exclamationTriangle32
    )

    static let expand = FrostedIconSet(
        size12: .expand12,
        size16: .expand16,
        size20: .expand20,
        size24: .expand24,
        size32: .expand32
    )

    static let export = FrostedIconSet(
        size12: .export12,
        size16: .export16,
        size20: .export20,
        size24: .export24,
        size32: .export32
    )

    static let eye = FrostedIconSet(
        size12: .eye12,
        size16: .eye16,
        size20: .eye20,
        size24: .eye24,
        size32: .eye32
    )

    static let eyeSlashed = FrostedIconSet(
        size12: .eyeSlashed12,
        size16: .eyeSlashed16,
        size20: .eyeSlashed20,
        size24: .eyeSlashed24,
        size32: .eyeSlashed32
    )

    static let facebook = FrostedIconSet(
        size12: .facebook12,
        size16: .facebook16,
        size20: .facebook20,
        size24: .facebook24,
        size32: .facebook32
    )

    static let facebookFilled = FrostedIconSet(
        size12: .facebookFilled12,
        size16: .facebookFilled16,
        size20: .facebookFilled20,
        size24: .facebookFilled24,
        size32: .facebookFilled32
    )

    static let facebookFilledSize = FrostedIconSet(
        size12: .facebookFilledSize12,
        size16: .facebookFilledSize16,
        size20: .facebookFilledSize20,
        size24: .facebookFilledSize24,
        size32: .facebookFilledSize32
    )

    static let facebookSize = FrostedIconSet(
        size12: .facebookSize12,
        size16: .facebookSize16,
        size20: .facebookSize20,
        size24: .facebookSize24,
        size32: .facebookSize32
    )

    static let fileLines = FrostedIconSet(
        size12: .fileLines12,
        size16: .fileLines16,
        size20: .fileLines20,
        size24: .fileLines24,
        size32: .fileLines32
    )

    static let fileLinesSize = FrostedIconSet(
        size12: .fileLinesSize12,
        size16: .fileLinesSize16,
        size20: .fileLinesSize20,
        size24: .fileLinesSize24,
        size32: .fileLinesSize32
    )

    static let filterDown = FrostedIconSet(
        size12: .filterDown12,
        size16: .filterDown16,
        size20: .filterDown20,
        size24: .filterDown24,
        size32: .filterDown32
    )

    static let flag = FrostedIconSet(
        size12: .flag12,
        size16: .flag16,
        size20: .flag20,
        size24: .flag24,
        size32: .flag32
    )

    static let flagFilled = FrostedIconSet(
        size12: .flagFilled12,
        size16: .flagFilled16,
        size20: .flagFilled20,
        size24: .flagFilled24,
        size32: .flagFilled32
    )

    static let folderAdd = FrostedIconSet(
        size12: .folderAdd12,
        size16: .folderAdd16,
        size20: .folderAdd20,
        size24: .folderAdd24,
        size32: .folderAdd32
    )

    static let fullScreen = FrostedIconSet(
        size12: .fullScreen12,
        size16: .fullScreen16,
        size20: .fullScreen20,
        size24: .fullScreen24,
        size32: .fullScreen32
    )

    static let gamepad = FrostedIconSet(
        size12: .gamepad12,
        size16: .gamepad16,
        size20: .gamepad20,
        size24: .gamepad24,
        size32: .gamepad32
    )

    static let gamepadFilled = FrostedIconSet(
        size12: .gamepadFilled12,
        size16: .gamepadFilled16,
        size20: .gamepadFilled20,
        size24: .gamepadFilled24,
        size32: .gamepadFilled32
    )

    static let gear = FrostedIconSet(
        size12: .gear12,
        size16: .gear16,
        size20: .gear20,
        size24: .gear24,
        size32: .gear32
    )

    static let gif = FrostedIconSet(
        size12: .gif12,
        size16: .gif16,
        size20: .gif20,
        size24: .gif24,
        size32: .gif32
    )

    static let gifFilled = FrostedIconSet(
        size12: .gifFilled12,
        size16: .gifFilled16,
        size20: .gifFilled20,
        size24: .gifFilled24,
        size32: .gifFilled32
    )

    static let gift = FrostedIconSet(
        size12: .gift12,
        size16: .gift16,
        size20: .gift20,
        size24: .gift24,
        size32: .gift32
    )

    static let globe = FrostedIconSet(
        size12: .globe12,
        size16: .globe16,
        size20: .globe20,
        size24: .globe24,
        size32: .globe32
    )

    static let globeInSquare = FrostedIconSet(
        size12: .globeInSquare12,
        size16: .globeInSquare16,
        size20: .globeInSquare20,
        size24: .globeInSquare24,
        size32: .globeInSquare32
    )

    static let grid = FrostedIconSet(
        size12: .grid12,
        size16: .grid16,
        size20: .grid20,
        size24: .grid24,
        size32: .grid32
    )

    static let gridAdd = FrostedIconSet(
        size12: .gridAdd12,
        size16: .gridAdd16,
        size20: .gridAdd20,
        size24: .gridAdd24,
        size32: .gridAdd32
    )

    static let handWave = FrostedIconSet(
        size12: .handWave12,
        size16: .handWave16,
        size20: .handWave20,
        size24: .handWave24,
        size32: .handWave32
    )

    static let happy = FrostedIconSet(
        size12: .happy12,
        size16: .happy16,
        size20: .happy20,
        size24: .happy24,
        size32: .happy32
    )

    static let happyFaceFilled = FrostedIconSet(
        size12: .happyFaceFilled12,
        size16: .happyFaceFilled16,
        size20: .happyFaceFilled20,
        size24: .happyFaceFilled24,
        size32: .happyFaceFilled32
    )

    static let happyFacePlus = FrostedIconSet(
        size12: .happyFacePlus12,
        size16: .happyFacePlus16,
        size20: .happyFacePlus20,
        size24: .happyFacePlus24,
        size32: .happyFacePlus32
    )

    static let happyFilled = FrostedIconSet(
        size12: .happyFilled12,
        size16: .happyFilled16,
        size20: .happyFilled20,
        size24: .happyFilled24,
        size32: .happyFilled32
    )

    static let happyPlus = FrostedIconSet(
        size12: .happyPlus12,
        size16: .happyPlus16,
        size20: .happyPlus20,
        size24: .happyPlus24,
        size32: .happyPlus32
    )

    static let hashtag = FrostedIconSet(
        size12: .hashtag12,
        size16: .hashtag16,
        size20: .hashtag20,
        size24: .hashtag24,
        size32: .hashtag32
    )

    static let hashtagFilled = FrostedIconSet(
        size12: .hashtagFilled12,
        size16: .hashtagFilled16,
        size20: .hashtagFilled20,
        size24: .hashtagFilled24,
        size32: .hashtagFilled32
    )

    static let heading = FrostedIconSet(
        size12: .heading12,
        size16: .heading16,
        size20: .heading20,
        size24: .heading24,
        size32: .heading32
    )

    static let headphones = FrostedIconSet(
        size12: .headphones12,
        size16: .headphones16,
        size20: .headphones20,
        size24: .headphones24,
        size32: .headphones32
    )

    static let heart = FrostedIconSet(
        size12: .heart12,
        size16: .heart16,
        size20: .heart20,
        size24: .heart24,
        size32: .heart32
    )

    static let heartFilled = FrostedIconSet(
        size12: .heartFilled12,
        size16: .heartFilled16,
        size20: .heartFilled20,
        size24: .heartFilled24,
        size32: .heartFilled32
    )

    static let home = FrostedIconSet(
        size12: .home12,
        size16: .home16,
        size20: .home20,
        size24: .home24,
        size32: .home32
    )

    static let hourGlass = FrostedIconSet(
        size12: .hourGlass12,
        size16: .hourGlass16,
        size20: .hourGlass20,
        size24: .hourGlass24,
        size32: .hourGlass32
    )

    static let illuminati = FrostedIconSet(
        size12: .illuminati12,
        size16: .illuminati16,
        size20: .illuminati20,
        size24: .illuminati24,
        size32: .illuminati32
    )

    static let illuminatiFilled = FrostedIconSet(
        size12: .illuminatiFilled12,
        size16: .illuminatiFilled16,
        size20: .illuminatiFilled20,
        size24: .illuminatiFilled24,
        size32: .illuminatiFilled32
    )

    static let inbox = FrostedIconSet(
        size12: .inbox12,
        size16: .inbox16,
        size20: .inbox20,
        size24: .inbox24,
        size32: .inbox32
    )

    static let info = FrostedIconSet(
        size12: .info12,
        size16: .info16,
        size20: .info20,
        size24: .info24,
        size32: .info32
    )

    static let infoCircle = FrostedIconSet(
        size12: .infoCircle12,
        size16: .infoCircle16,
        size20: .infoCircle20,
        size24: .infoCircle24,
        size32: .infoCircle32
    )

    static let infoCircleFilled = FrostedIconSet(
        size12: .infoCircleFilled12,
        size16: .infoCircleFilled16,
        size20: .infoCircleFilled20,
        size24: .infoCircleFilled24,
        size32: .infoCircleFilled32
    )

    static let infoFilled = FrostedIconSet(
        size12: .infoFilled12,
        size16: .infoFilled16,
        size20: .infoFilled20,
        size24: .infoFilled24,
        size32: .infoFilled32
    )

    static let infoOutline = FrostedIconSet(
        size12: .infoOutline12,
        size16: .infoOutline16,
        size20: .infoOutline20,
        size24: .infoOutline24,
        size32: .infoOutline32
    )

    static let infoSize = FrostedIconSet(
        size12: .infoSize12,
        size16: .infoSize16,
        size20: .infoSize20,
        size24: .infoSize24,
        size32: .infoSize32
    )

    static let infoSquare = FrostedIconSet(
        size12: .infoSquare12,
        size16: .infoSquare16,
        size20: .infoSquare20,
        size24: .infoSquare24,
        size32: .infoSquare32
    )

    static let information = FrostedIconSet(
        size12: .information12,
        size16: .information16,
        size20: .information20,
        size24: .information24,
        size32: .information32
    )

    static let instagram = FrostedIconSet(
        size12: .instagram12,
        size16: .instagram16,
        size20: .instagram20,
        size24: .instagram24,
        size32: .instagram32
    )

    static let instagramSize = FrostedIconSet(
        size12: .instagramSize12,
        size16: .instagramSize16,
        size20: .instagramSize20,
        size24: .instagramSize24,
        size32: .instagramSize32
    )

    static let italic = FrostedIconSet(
        size12: .italic12,
        size16: .italic16,
        size20: .italic20,
        size24: .italic24,
        size32: .italic32
    )

    static let k = FrostedIconSet(
        size12: .k12,
        size16: .k16,
        size20: .k20,
        size24: .k24,
        size32: .k32
    )

    static let leaf = FrostedIconSet(
        size12: .leaf12,
        size16: .leaf16,
        size20: .leaf20,
        size24: .leaf24,
        size32: .leaf32
    )

    static let leaveReview = FrostedIconSet(
        size12: .leaveReview12,
        size16: .leaveReview16,
        size20: .leaveReview20,
        size24: .leaveReview24,
        size32: .leaveReview32
    )

    static let lightbulb = FrostedIconSet(
        size12: .lightbulb12,
        size16: .lightbulb16,
        size20: .lightbulb20,
        size24: .lightbulb24,
        size32: .lightbulb32
    )

    static let lightsOff = FrostedIconSet(
        size12: .lightsOff12,
        size16: .lightsOff16,
        size20: .lightsOff20,
        size24: .lightsOff24,
        size32: .lightsOff32
    )

    static let lightsOn = FrostedIconSet(
        size12: .lightsOn12,
        size16: .lightsOn16,
        size20: .lightsOn20,
        size24: .lightsOn24,
        size32: .lightsOn32
    )

    static let lilstNumber = FrostedIconSet(
        size12: .lilstNumber12,
        size16: .lilstNumber16,
        size20: .lilstNumber20,
        size24: .lilstNumber24,
        size32: .lilstNumber32
    )

    static let link = FrostedIconSet(
        size12: .link12,
        size16: .link16,
        size20: .link20,
        size24: .link24,
        size32: .link32
    )

    static let linkAdd = FrostedIconSet(
        size12: .linkAdd12,
        size16: .linkAdd16,
        size20: .linkAdd20,
        size24: .linkAdd24,
        size32: .linkAdd32
    )

    static let linkSlash = FrostedIconSet(
        size12: .linkSlash12,
        size16: .linkSlash16,
        size20: .linkSlash20,
        size24: .linkSlash24,
        size32: .linkSlash32
    )

    static let linkedin = FrostedIconSet(
        size12: .linkedin12,
        size16: .linkedin16,
        size20: .linkedin20,
        size24: .linkedin24,
        size32: .linkedin32
    )

    static let list = FrostedIconSet(
        size12: .list12,
        size16: .list16,
        size20: .list20,
        size24: .list24,
        size32: .list32
    )

    static let listBullet = FrostedIconSet(
        size12: .listBullet12,
        size16: .listBullet16,
        size20: .listBullet20,
        size24: .listBullet24,
        size32: .listBullet32
    )

    static let listCheck = FrostedIconSet(
        size12: .listCheck12,
        size16: .listCheck16,
        size20: .listCheck20,
        size24: .listCheck24,
        size32: .listCheck32
    )

    static let listNumber = FrostedIconSet(
        size12: .listNumber12,
        size16: .listNumber16,
        size20: .listNumber20,
        size24: .listNumber24,
        size32: .listNumber32
    )

    static let locationPin = FrostedIconSet(
        size12: .locationPin12,
        size16: .locationPin16,
        size20: .locationPin20,
        size24: .locationPin24,
        size32: .locationPin32
    )

    static let lock = FrostedIconSet(
        size12: .lock12,
        size16: .lock16,
        size20: .lock20,
        size24: .lock24,
        size32: .lock32
    )

    static let lockFilled = FrostedIconSet(
        size12: .lockFilled12,
        size16: .lockFilled16,
        size20: .lockFilled20,
        size24: .lockFilled24,
        size32: .lockFilled32
    )

    static let lockOpen = FrostedIconSet(
        size12: .lockOpen12,
        size16: .lockOpen16,
        size20: .lockOpen20,
        size24: .lockOpen24,
        size32: .lockOpen32
    )

    static let logout = FrostedIconSet(
        size12: .logout12,
        size16: .logout16,
        size20: .logout20,
        size24: .logout24,
        size32: .logout32
    )

    static let magnifyingGlass = FrostedIconSet(
        size12: .magnifyingGlass12,
        size16: .magnifyingGlass16,
        size20: .magnifyingGlass20,
        size24: .magnifyingGlass24,
        size32: .magnifyingGlass32
    )

    static let mail = FrostedIconSet(
        size12: .mail12,
        size16: .mail16,
        size20: .mail20,
        size24: .mail24,
        size32: .mail32
    )

    static let mailFilled = FrostedIconSet(
        size12: .mailFilled12,
        size16: .mailFilled16,
        size20: .mailFilled20,
        size24: .mailFilled24,
        size32: .mailFilled32
    )

    static let mailOut = FrostedIconSet(
        size12: .mailOut12,
        size16: .mailOut16,
        size20: .mailOut20,
        size24: .mailOut24,
        size32: .mailOut32
    )

    static let markAsRead = FrostedIconSet(
        size12: .markAsRead12,
        size16: .markAsRead16,
        size20: .markAsRead20,
        size24: .markAsRead24,
        size32: .markAsRead32
    )

    static let markAsUnread = FrostedIconSet(
        size12: .markAsUnread12,
        size16: .markAsUnread16,
        size20: .markAsUnread20,
        size24: .markAsUnread24,
        size32: .markAsUnread32
    )

    static let medalCheck = FrostedIconSet(
        size12: .medalCheck12,
        size16: .medalCheck16,
        size20: .medalCheck20,
        size24: .medalCheck24,
        size32: .medalCheck32
    )

    static let medalCheckSize = FrostedIconSet(
        size12: .medalCheckSize12,
        size16: .medalCheckSize16,
        size20: .medalCheckSize20,
        size24: .medalCheckSize24,
        size32: .medalCheckSize32
    )

    static let medalCheckmark = FrostedIconSet(
        size12: .medalCheckmark12,
        size16: .medalCheckmark16,
        size20: .medalCheckmark20,
        size24: .medalCheckmark24,
        size32: .medalCheckmark32
    )

    static let megaphone = FrostedIconSet(
        size12: .megaphone12,
        size16: .megaphone16,
        size20: .megaphone20,
        size24: .megaphone24,
        size32: .megaphone32
    )

    static let mentionFilled = FrostedIconSet(
        size12: .mentionFilled12,
        size16: .mentionFilled16,
        size20: .mentionFilled20,
        size24: .mentionFilled24,
        size32: .mentionFilled32
    )

    static let menu = FrostedIconSet(
        size12: .menu12,
        size16: .menu16,
        size20: .menu20,
        size24: .menu24,
        size32: .menu32
    )

    static let merch = FrostedIconSet(
        size12: .merch12,
        size16: .merch16,
        size20: .merch20,
        size24: .merch24,
        size32: .merch32
    )

    static let message = FrostedIconSet(
        size12: .message12,
        size16: .message16,
        size20: .message20,
        size24: .message24,
        size32: .message32
    )

    static let messageEdit = FrostedIconSet(
        size12: .messageEdit12,
        size16: .messageEdit16,
        size20: .messageEdit20,
        size24: .messageEdit24,
        size32: .messageEdit32
    )

    static let messageFilled = FrostedIconSet(
        size12: .messageFilled12,
        size16: .messageFilled16,
        size20: .messageFilled20,
        size24: .messageFilled24,
        size32: .messageFilled32
    )

    static let messageNotification = FrostedIconSet(
        size12: .messageNotification12,
        size16: .messageNotification16,
        size20: .messageNotification20,
        size24: .messageNotification24,
        size32: .messageNotification32
    )

    static let messageSlashed = FrostedIconSet(
        size12: .messageSlashed12,
        size16: .messageSlashed16,
        size20: .messageSlashed20,
        size24: .messageSlashed24,
        size32: .messageSlashed32
    )

    static let messages = FrostedIconSet(
        size12: .messages12,
        size16: .messages16,
        size20: .messages20,
        size24: .messages24,
        size32: .messages32
    )

    static let messagesQuestion = FrostedIconSet(
        size12: .messagesQuestion12,
        size16: .messagesQuestion16,
        size20: .messagesQuestion20,
        size24: .messagesQuestion24,
        size32: .messagesQuestion32
    )

    static let micOff = FrostedIconSet(
        size12: .micOff12,
        size16: .micOff16,
        size20: .micOff20,
        size24: .micOff24,
        size32: .micOff32
    )

    static let micOn = FrostedIconSet(
        size12: .micOn12,
        size16: .micOn16,
        size20: .micOn20,
        size24: .micOn24,
        size32: .micOn32
    )

    static let microphone = FrostedIconSet(
        size12: .microphone12,
        size16: .microphone16,
        size20: .microphone20,
        size24: .microphone24,
        size32: .microphone32
    )

    static let microphoneOff = FrostedIconSet(
        size12: .microphoneOff12,
        size16: .microphoneOff16,
        size20: .microphoneOff20,
        size24: .microphoneOff24,
        size32: .microphoneOff32
    )

    static let minimize = FrostedIconSet(
        size12: .minimize12,
        size16: .minimize16,
        size20: .minimize20,
        size24: .minimize24,
        size32: .minimize32
    )

    static let mobilePhone = FrostedIconSet(
        size12: .mobilePhone12,
        size16: .mobilePhone16,
        size20: .mobilePhone20,
        size24: .mobilePhone24,
        size32: .mobilePhone32
    )

    static let mobilePhoneSize = FrostedIconSet(
        size12: .mobilePhoneSize12,
        size16: .mobilePhoneSize16,
        size20: .mobilePhoneSize20,
        size24: .mobilePhoneSize24,
        size32: .mobilePhoneSize32
    )

    static let monitor = FrostedIconSet(
        size12: .monitor12,
        size16: .monitor16,
        size20: .monitor20,
        size24: .monitor24,
        size32: .monitor32
    )

    static let monitorSize = FrostedIconSet(
        size12: .monitorSize12,
        size16: .monitorSize16,
        size20: .monitorSize20,
        size24: .monitorSize24,
        size32: .monitorSize32
    )

    static let moon = FrostedIconSet(
        size12: .moon12,
        size16: .moon16,
        size20: .moon20,
        size24: .moon24,
        size32: .moon32
    )

    static let moonFilled = FrostedIconSet(
        size12: .moonFilled12,
        size16: .moonFilled16,
        size20: .moonFilled20,
        size24: .moonFilled24,
        size32: .moonFilled32
    )

    static let moonSize = FrostedIconSet(
        size12: .moonSize12,
        size16: .moonSize16,
        size20: .moonSize20,
        size24: .moonSize24,
        size32: .moonSize32
    )

    static let notificationBellCrossed = FrostedIconSet(
        size12: .notificationBellCrossed12,
        size16: .notificationBellCrossed16,
        size20: .notificationBellCrossed20,
        size24: .notificationBellCrossed24,
        size32: .notificationBellCrossed32
    )

    static let palette = FrostedIconSet(
        size12: .palette12,
        size16: .palette16,
        size20: .palette20,
        size24: .palette24,
        size32: .palette32
    )

    static let paperAirplaneFilled = FrostedIconSet(
        size12: .paperAirplaneFilled12,
        size16: .paperAirplaneFilled16,
        size20: .paperAirplaneFilled20,
        size24: .paperAirplaneFilled24,
        size32: .paperAirplaneFilled32
    )

    static let paperAirplaneFilledUp = FrostedIconSet(
        size12: .paperAirplaneFilledUp12,
        size16: .paperAirplaneFilledUp16,
        size20: .paperAirplaneFilledUp20,
        size24: .paperAirplaneFilledUp24,
        size32: .paperAirplaneFilledUp32
    )

    static let paperAirplaneUpFilled = FrostedIconSet(
        size12: .paperAirplaneUpFilled12,
        size16: .paperAirplaneUpFilled16,
        size20: .paperAirplaneUpFilled20,
        size24: .paperAirplaneUpFilled24,
        size32: .paperAirplaneUpFilled32
    )

    static let parachute = FrostedIconSet(
        size12: .parachute12,
        size16: .parachute16,
        size20: .parachute20,
        size24: .parachute24,
        size32: .parachute32
    )

    static let participants = FrostedIconSet(
        size12: .participants12,
        size16: .participants16,
        size20: .participants20,
        size24: .participants24,
        size32: .participants32
    )

    static let pause = FrostedIconSet(
        size12: .pause12,
        size16: .pause16,
        size20: .pause20,
        size24: .pause24,
        size32: .pause32
    )

    static let pauseCircle = FrostedIconSet(
        size12: .pauseCircle12,
        size16: .pauseCircle16,
        size20: .pauseCircle20,
        size24: .pauseCircle24,
        size32: .pauseCircle32
    )

    static let pauseFilled = FrostedIconSet(
        size12: .pauseFilled12,
        size16: .pauseFilled16,
        size20: .pauseFilled20,
        size24: .pauseFilled24,
        size32: .pauseFilled32
    )

    static let paypal = FrostedIconSet(
        size12: .paypal12,
        size16: .paypal16,
        size20: .paypal20,
        size24: .paypal24,
        size32: .paypal32
    )

    static let pencil = FrostedIconSet(
        size12: .pencil12,
        size16: .pencil16,
        size20: .pencil20,
        size24: .pencil24,
        size32: .pencil32
    )

    static let people = FrostedIconSet(
        size12: .people12,
        size16: .people16,
        size20: .people20,
        size24: .people24,
        size32: .people32
    )

    static let people2 = FrostedIconSet(
        size12: .people212,
        size16: .people216,
        size20: .people220,
        size24: .people224,
        size32: .people232
    )

    static let peoplePlus = FrostedIconSet(
        size12: .peoplePlus12,
        size16: .peoplePlus16,
        size20: .peoplePlus20,
        size24: .peoplePlus24,
        size32: .peoplePlus32
    )

    static let percentage = FrostedIconSet(
        size12: .percentage12,
        size16: .percentage16,
        size20: .percentage20,
        size24: .percentage24,
        size32: .percentage32
    )

    static let photo = FrostedIconSet(
        size12: .photo12,
        size16: .photo16,
        size20: .photo20,
        size24: .photo24,
        size32: .photo32
    )

    static let photoFilled = FrostedIconSet(
        size12: .photoFilled12,
        size16: .photoFilled16,
        size20: .photoFilled20,
        size24: .photoFilled24,
        size32: .photoFilled32
    )

    static let photos = FrostedIconSet(
        size12: .photos12,
        size16: .photos16,
        size20: .photos20,
        size24: .photos24,
        size32: .photos32
    )

    static let pictureInPicture = FrostedIconSet(
        size12: .pictureInPicture12,
        size16: .pictureInPicture16,
        size20: .pictureInPicture20,
        size24: .pictureInPicture24,
        size32: .pictureInPicture32
    )

    static let pin = FrostedIconSet(
        size12: .pin12,
        size16: .pin16,
        size20: .pin20,
        size24: .pin24,
        size32: .pin32
    )

    static let pinFilled = FrostedIconSet(
        size12: .pinFilled12,
        size16: .pinFilled16,
        size20: .pinFilled20,
        size24: .pinFilled24,
        size32: .pinFilled32
    )

    static let pinTilted = FrostedIconSet(
        size12: .pinTilted12,
        size16: .pinTilted16,
        size20: .pinTilted20,
        size24: .pinTilted24,
        size32: .pinTilted32
    )

    static let pinTiltedFilled = FrostedIconSet(
        size12: .pinTiltedFilled12,
        size16: .pinTiltedFilled16,
        size20: .pinTiltedFilled20,
        size24: .pinTiltedFilled24,
        size32: .pinTiltedFilled32
    )

    static let plane = FrostedIconSet(
        size12: .plane12,
        size16: .plane16,
        size20: .plane20,
        size24: .plane24,
        size32: .plane32
    )

    static let play = FrostedIconSet(
        size12: .play12,
        size16: .play16,
        size20: .play20,
        size24: .play24,
        size32: .play32
    )

    static let playCircle = FrostedIconSet(
        size12: .playCircle12,
        size16: .playCircle16,
        size20: .playCircle20,
        size24: .playCircle24,
        size32: .playCircle32
    )

    static let playFilled = FrostedIconSet(
        size12: .playFilled12,
        size16: .playFilled16,
        size20: .playFilled20,
        size24: .playFilled24,
        size32: .playFilled32
    )

    static let plus = FrostedIconSet(
        size12: .plus12,
        size16: .plus16,
        size20: .plus20,
        size24: .plus24,
        size32: .plus32
    )

    static let plusCircle = FrostedIconSet(
        size12: .plusCircle12,
        size16: .plusCircle16,
        size20: .plusCircle20,
        size24: .plusCircle24,
        size32: .plusCircle32
    )

    static let plusRectangle = FrostedIconSet(
        size12: .plusRectangle12,
        size16: .plusRectangle16,
        size20: .plusRectangle20,
        size24: .plusRectangle24,
        size32: .plusRectangle32
    )

    static let profile = FrostedIconSet(
        size12: .profile12,
        size16: .profile16,
        size20: .profile20,
        size24: .profile24,
        size32: .profile32
    )

    static let profileCircle = FrostedIconSet(
        size12: .profileCircle12,
        size16: .profileCircle16,
        size20: .profileCircle20,
        size24: .profileCircle24,
        size32: .profileCircle32
    )

    static let profileFilled = FrostedIconSet(
        size12: .profileFilled12,
        size16: .profileFilled16,
        size20: .profileFilled20,
        size24: .profileFilled24,
        size32: .profileFilled32
    )

    static let profileX = FrostedIconSet(
        size12: .profileX12,
        size16: .profileX16,
        size20: .profileX20,
        size24: .profileX24,
        size32: .profileX32
    )

    static let questionCircle = FrostedIconSet(
        size12: .questionCircle12,
        size16: .questionCircle16,
        size20: .questionCircle20,
        size24: .questionCircle24,
        size32: .questionCircle32
    )

    static let quoteLeft = FrostedIconSet(
        size12: .quoteLeft12,
        size16: .quoteLeft16,
        size20: .quoteLeft20,
        size24: .quoteLeft24,
        size32: .quoteLeft32
    )

    static let quoteRight = FrostedIconSet(
        size12: .quoteRight12,
        size16: .quoteRight16,
        size20: .quoteRight20,
        size24: .quoteRight24,
        size32: .quoteRight32
    )

    static let raiseHand = FrostedIconSet(
        size12: .raiseHand12,
        size16: .raiseHand16,
        size20: .raiseHand20,
        size24: .raiseHand24,
        size32: .raiseHand32
    )

    static let receipt = FrostedIconSet(
        size12: .receipt12,
        size16: .receipt16,
        size20: .receipt20,
        size24: .receipt24,
        size32: .receipt32
    )

    static let receptionBell = FrostedIconSet(
        size12: .receptionBell12,
        size16: .receptionBell16,
        size20: .receptionBell20,
        size24: .receptionBell24,
        size32: .receptionBell32
    )

    static let receptionBellFilled = FrostedIconSet(
        size12: .receptionBellFilled12,
        size16: .receptionBellFilled16,
        size20: .receptionBellFilled20,
        size24: .receptionBellFilled24,
        size32: .receptionBellFilled32
    )

    static let rectangleStack = FrostedIconSet(
        size12: .rectangleStack12,
        size16: .rectangleStack16,
        size20: .rectangleStack20,
        size24: .rectangleStack24,
        size32: .rectangleStack32
    )

    static let refresh = FrostedIconSet(
        size12: .refresh12,
        size16: .refresh16,
        size20: .refresh20,
        size24: .refresh24,
        size32: .refresh32
    )

    static let refund = FrostedIconSet(
        size12: .refund12,
        size16: .refund16,
        size20: .refund20,
        size24: .refund24,
        size32: .refund32
    )

    static let reply = FrostedIconSet(
        size12: .reply12,
        size16: .reply16,
        size20: .reply20,
        size24: .reply24,
        size32: .reply32
    )

    static let replyFilled = FrostedIconSet(
        size12: .replyFilled12,
        size16: .replyFilled16,
        size20: .replyFilled20,
        size24: .replyFilled24,
        size32: .replyFilled32
    )

    static let rewardDiamond = FrostedIconSet(
        size12: .rewardDiamond12,
        size16: .rewardDiamond16,
        size20: .rewardDiamond20,
        size24: .rewardDiamond24,
        size32: .rewardDiamond32
    )

    static let rocket = FrostedIconSet(
        size12: .rocket12,
        size16: .rocket16,
        size20: .rocket20,
        size24: .rocket24,
        size32: .rocket32
    )

    static let rotate = FrostedIconSet(
        size12: .rotate12,
        size16: .rotate16,
        size20: .rotate20,
        size24: .rotate24,
        size32: .rotate32
    )

    static let rotateCard = FrostedIconSet(
        size12: .rotateCard12,
        size16: .rotateCard16,
        size20: .rotateCard20,
        size24: .rotateCard24,
        size32: .rotateCard32
    )

    static let rotateLeft = FrostedIconSet(
        size12: .rotateLeft12,
        size16: .rotateLeft16,
        size20: .rotateLeft20,
        size24: .rotateLeft24,
        size32: .rotateLeft32
    )

    static let rotateLeftSize = FrostedIconSet(
        size12: .rotateLeftSize12,
        size16: .rotateLeftSize16,
        size20: .rotateLeftSize20,
        size24: .rotateLeftSize24,
        size32: .rotateLeftSize32
    )

    static let rotateRight = FrostedIconSet(
        size12: .rotateRight12,
        size16: .rotateRight16,
        size20: .rotateRight20,
        size24: .rotateRight24,
        size32: .rotateRight32
    )

    static let rotateRightSize = FrostedIconSet(
        size12: .rotateRightSize12,
        size16: .rotateRightSize16,
        size20: .rotateRightSize20,
        size24: .rotateRightSize24,
        size32: .rotateRightSize32
    )

    static let roundedArrowAngleLeft = FrostedIconSet(
        size12: .roundedArrowAngleLeft12,
        size16: .roundedArrowAngleLeft16,
        size20: .roundedArrowAngleLeft20,
        size24: .roundedArrowAngleLeft24,
        size32: .roundedArrowAngleLeft32
    )

    static let roundedArrowAngleRight = FrostedIconSet(
        size12: .roundedArrowAngleRight12,
        size16: .roundedArrowAngleRight16,
        size20: .roundedArrowAngleRight20,
        size24: .roundedArrowAngleRight24,
        size32: .roundedArrowAngleRight32
    )

    static let sad = FrostedIconSet(
        size12: .sad12,
        size16: .sad16,
        size20: .sad20,
        size24: .sad24,
        size32: .sad32
    )

    static let sadFace = FrostedIconSet(
        size12: .sadFace12,
        size16: .sadFace16,
        size20: .sadFace20,
        size24: .sadFace24,
        size32: .sadFace32
    )

    static let sadFaceFilled = FrostedIconSet(
        size12: .sadFaceFilled12,
        size16: .sadFaceFilled16,
        size20: .sadFaceFilled20,
        size24: .sadFaceFilled24,
        size32: .sadFaceFilled32
    )

    static let sadFilled = FrostedIconSet(
        size12: .sadFilled12,
        size16: .sadFilled16,
        size20: .sadFilled20,
        size24: .sadFilled24,
        size32: .sadFilled32
    )

    static let sealCheckmark = FrostedIconSet(
        size12: .sealCheckmark12,
        size16: .sealCheckmark16,
        size20: .sealCheckmark20,
        size24: .sealCheckmark24,
        size32: .sealCheckmark32
    )

    static let sealCheckmarkFilled = FrostedIconSet(
        size12: .sealCheckmarkFilled12,
        size16: .sealCheckmarkFilled16,
        size20: .sealCheckmarkFilled20,
        size24: .sealCheckmarkFilled24,
        size32: .sealCheckmarkFilled32
    )

    static let sealExclamation = FrostedIconSet(
        size12: .sealExclamation12,
        size16: .sealExclamation16,
        size20: .sealExclamation20,
        size24: .sealExclamation24,
        size32: .sealExclamation32
    )

    static let sealExclamationFilled = FrostedIconSet(
        size12: .sealExclamationFilled12,
        size16: .sealExclamationFilled16,
        size20: .sealExclamationFilled20,
        size24: .sealExclamationFilled24,
        size32: .sealExclamationFilled32
    )

    static let shareNodes = FrostedIconSet(
        size12: .shareNodes12,
        size16: .shareNodes16,
        size20: .shareNodes20,
        size24: .shareNodes24,
        size32: .shareNodes32
    )

    static let shareScreen = FrostedIconSet(
        size12: .shareScreen12,
        size16: .shareScreen16,
        size20: .shareScreen20,
        size24: .shareScreen24,
        size32: .shareScreen32
    )

    static let shieldCheckmark = FrostedIconSet(
        size12: .shieldCheckmark12,
        size16: .shieldCheckmark16,
        size20: .shieldCheckmark20,
        size24: .shieldCheckmark24,
        size32: .shieldCheckmark32
    )

    static let shieldHalf = FrostedIconSet(
        size12: .shieldHalf12,
        size16: .shieldHalf16,
        size20: .shieldHalf20,
        size24: .shieldHalf24,
        size32: .shieldHalf32
    )

    static let shop = FrostedIconSet(
        size12: .shop12,
        size16: .shop16,
        size20: .shop20,
        size24: .shop24,
        size32: .shop32
    )

    static let shoppingBag = FrostedIconSet(
        size12: .shoppingBag12,
        size16: .shoppingBag16,
        size20: .shoppingBag20,
        size24: .shoppingBag24,
        size32: .shoppingBag32
    )

    static let sparkle = FrostedIconSet(
        size12: .sparkle12,
        size16: .sparkle16,
        size20: .sparkle20,
        size24: .sparkle24,
        size32: .sparkle32
    )

    static let sparkleFilled = FrostedIconSet(
        size12: .sparkleFilled12,
        size16: .sparkleFilled16,
        size20: .sparkleFilled20,
        size24: .sparkleFilled24,
        size32: .sparkleFilled32
    )

    static let sparkleMultiple = FrostedIconSet(
        size12: .sparkleMultiple12,
        size16: .sparkleMultiple16,
        size20: .sparkleMultiple20,
        size24: .sparkleMultiple24,
        size32: .sparkleMultiple32
    )

    static let sparkleRectangle = FrostedIconSet(
        size12: .sparkleRectangle12,
        size16: .sparkleRectangle16,
        size20: .sparkleRectangle20,
        size24: .sparkleRectangle24,
        size32: .sparkleRectangle32
    )

    static let sparkles = FrostedIconSet(
        size12: .sparkles12,
        size16: .sparkles16,
        size20: .sparkles20,
        size24: .sparkles24,
        size32: .sparkles32
    )

    static let speaker = FrostedIconSet(
        size12: .speaker12,
        size16: .speaker16,
        size20: .speaker20,
        size24: .speaker24,
        size32: .speaker32
    )

    static let split = FrostedIconSet(
        size12: .split12,
        size16: .split16,
        size20: .split20,
        size24: .split24,
        size32: .split32
    )

    static let squareAdd = FrostedIconSet(
        size12: .squareAdd12,
        size16: .squareAdd16,
        size20: .squareAdd20,
        size24: .squareAdd24,
        size32: .squareAdd32
    )

    static let star = FrostedIconSet(
        size12: .star12,
        size16: .star16,
        size20: .star20,
        size24: .star24,
        size32: .star32
    )

    static let starFilled = FrostedIconSet(
        size12: .starFilled12,
        size16: .starFilled16,
        size20: .starFilled20,
        size24: .starFilled24,
        size32: .starFilled32
    )

    static let starHalf = FrostedIconSet(
        size12: .starHalf12,
        size16: .starHalf16,
        size20: .starHalf20,
        size24: .starHalf24,
        size32: .starHalf32
    )

    static let stats = FrostedIconSet(
        size12: .stats12,
        size16: .stats16,
        size20: .stats20,
        size24: .stats24,
        size32: .stats32
    )

    static let sticker = FrostedIconSet(
        size12: .sticker12,
        size16: .sticker16,
        size20: .sticker20,
        size24: .sticker24,
        size32: .sticker32
    )

    static let stickerFilled = FrostedIconSet(
        size12: .stickerFilled12,
        size16: .stickerFilled16,
        size20: .stickerFilled20,
        size24: .stickerFilled24,
        size32: .stickerFilled32
    )

    static let storefrontItem = FrostedIconSet(
        size12: .storefrontItem12,
        size16: .storefrontItem16,
        size20: .storefrontItem20,
        size24: .storefrontItem24,
        size32: .storefrontItem32
    )

    static let strikethrough = FrostedIconSet(
        size12: .strikethrough12,
        size16: .strikethrough16,
        size20: .strikethrough20,
        size24: .strikethrough24,
        size32: .strikethrough32
    )

    static let subtract = FrostedIconSet(
        size12: .subtract12,
        size16: .subtract16,
        size20: .subtract20,
        size24: .subtract24,
        size32: .subtract32
    )

    static let sun = FrostedIconSet(
        size12: .sun12,
        size16: .sun16,
        size20: .sun20,
        size24: .sun24,
        size32: .sun32
    )

    static let sunSize = FrostedIconSet(
        size12: .sunSize12,
        size16: .sunSize16,
        size20: .sunSize20,
        size24: .sunSize24,
        size32: .sunSize32
    )

    static let swords = FrostedIconSet(
        size12: .swords12,
        size16: .swords16,
        size20: .swords20,
        size24: .swords24,
        size32: .swords32
    )

    static let tShirt = FrostedIconSet(
        size12: .tShirt12,
        size16: .tShirt16,
        size20: .tShirt20,
        size24: .tShirt24,
        size32: .tShirt32
    )

    static let tShirtFilled = FrostedIconSet(
        size12: .tShirtFilled12,
        size16: .tShirtFilled16,
        size20: .tShirtFilled20,
        size24: .tShirtFilled24,
        size32: .tShirtFilled32
    )

    static let table = FrostedIconSet(
        size12: .table12,
        size16: .table16,
        size20: .table20,
        size24: .table24,
        size32: .table32
    )

    static let tag = FrostedIconSet(
        size12: .tag12,
        size16: .tag16,
        size20: .tag20,
        size24: .tag24,
        size32: .tag32
    )

    static let telegram = FrostedIconSet(
        size12: .telegram12,
        size16: .telegram16,
        size20: .telegram20,
        size24: .telegram24,
        size32: .telegram32
    )

    static let telegramFilled = FrostedIconSet(
        size12: .telegramFilled12,
        size16: .telegramFilled16,
        size20: .telegramFilled20,
        size24: .telegramFilled24,
        size32: .telegramFilled32
    )

    static let telegramFilledSize = FrostedIconSet(
        size12: .telegramFilledSize12,
        size16: .telegramFilledSize16,
        size20: .telegramFilledSize20,
        size24: .telegramFilledSize24,
        size32: .telegramFilledSize32
    )

    static let telegramSize = FrostedIconSet(
        size12: .telegramSize12,
        size16: .telegramSize16,
        size20: .telegramSize20,
        size24: .telegramSize24,
        size32: .telegramSize32
    )

    static let telephone = FrostedIconSet(
        size12: .telephone12,
        size16: .telephone16,
        size20: .telephone20,
        size24: .telephone24,
        size32: .telephone32
    )

    static let threeDotsCircle = FrostedIconSet(
        size12: .threeDotsCircle12,
        size16: .threeDotsCircle16,
        size20: .threeDotsCircle20,
        size24: .threeDotsCircle24,
        size32: .threeDotsCircle32
    )

    static let threeDotsCircleSize = FrostedIconSet(
        size12: .threeDotsCircleSize12,
        size16: .threeDotsCircleSize16,
        size20: .threeDotsCircleSize20,
        size24: .threeDotsCircleSize24,
        size32: .threeDotsCircleSize32
    )

    static let threeDotsHorizontal = FrostedIconSet(
        size12: .threeDotsHorizontal12,
        size16: .threeDotsHorizontal16,
        size20: .threeDotsHorizontal20,
        size24: .threeDotsHorizontal24,
        size32: .threeDotsHorizontal32
    )

    static let threeDotsVertical = FrostedIconSet(
        size12: .threeDotsVertical12,
        size16: .threeDotsVertical16,
        size20: .threeDotsVertical20,
        size24: .threeDotsVertical24,
        size32: .threeDotsVertical32
    )

    static let thumbDown = FrostedIconSet(
        size12: .thumbDown12,
        size16: .thumbDown16,
        size20: .thumbDown20,
        size24: .thumbDown24,
        size32: .thumbDown32
    )

    static let thumbDownFilled = FrostedIconSet(
        size12: .thumbDownFilled12,
        size16: .thumbDownFilled16,
        size20: .thumbDownFilled20,
        size24: .thumbDownFilled24,
        size32: .thumbDownFilled32
    )

    static let thumbUp = FrostedIconSet(
        size12: .thumbUp12,
        size16: .thumbUp16,
        size20: .thumbUp20,
        size24: .thumbUp24,
        size32: .thumbUp32
    )

    static let thumbUpFilled = FrostedIconSet(
        size12: .thumbUpFilled12,
        size16: .thumbUpFilled16,
        size20: .thumbUpFilled20,
        size24: .thumbUpFilled24,
        size32: .thumbUpFilled32
    )

    static let tiktokFilledSize = FrostedIconSet(
        size12: .tiktokFilledSize12,
        size16: .tiktokFilledSize16,
        size20: .tiktokFilledSize20,
        size24: .tiktokFilledSize24,
        size32: .tiktokFilledSize32
    )

    static let tiktokSize = FrostedIconSet(
        size12: .tiktokSize12,
        size16: .tiktokSize16,
        size20: .tiktokSize20,
        size24: .tiktokSize24,
        size32: .tiktokSize32
    )

    static let timeSkipLeft = FrostedIconSet(
        size12: .timeSkipLeft12,
        size16: .timeSkipLeft16,
        size20: .timeSkipLeft20,
        size24: .timeSkipLeft24,
        size32: .timeSkipLeft32
    )

    static let timeSkipRight = FrostedIconSet(
        size12: .timeSkipRight12,
        size16: .timeSkipRight16,
        size20: .timeSkipRight20,
        size24: .timeSkipRight24,
        size32: .timeSkipRight32
    )

    static let trash = FrostedIconSet(
        size12: .trash12,
        size16: .trash16,
        size20: .trash20,
        size24: .trash24,
        size32: .trash32
    )

    static let trashFilled = FrostedIconSet(
        size12: .trashFilled12,
        size16: .trashFilled16,
        size20: .trashFilled20,
        size24: .trashFilled24,
        size32: .trashFilled32
    )

    static let trashSolid = FrostedIconSet(
        size12: .trashSolid12,
        size16: .trashSolid16,
        size20: .trashSolid20,
        size24: .trashSolid24,
        size32: .trashSolid32
    )

    static let trophy = FrostedIconSet(
        size12: .trophy12,
        size16: .trophy16,
        size20: .trophy20,
        size24: .trophy24,
        size32: .trophy32
    )

    static let truck = FrostedIconSet(
        size12: .truck12,
        size16: .truck16,
        size20: .truck20,
        size24: .truck24,
        size32: .truck32
    )

    static let twitch = FrostedIconSet(
        size12: .twitch12,
        size16: .twitch16,
        size20: .twitch20,
        size24: .twitch24,
        size32: .twitch32
    )

    static let twitter = FrostedIconSet(
        size12: .twitter12,
        size16: .twitter16,
        size20: .twitter20,
        size24: .twitter24,
        size32: .twitter32
    )

    static let twitterFilled = FrostedIconSet(
        size12: .twitterFilled12,
        size16: .twitterFilled16,
        size20: .twitterFilled20,
        size24: .twitterFilled24,
        size32: .twitterFilled32
    )

    static let twitterFilledSize = FrostedIconSet(
        size12: .twitterFilledSize12,
        size16: .twitterFilledSize16,
        size20: .twitterFilledSize20,
        size24: .twitterFilledSize24,
        size32: .twitterFilledSize32
    )

    static let twitterSize = FrostedIconSet(
        size12: .twitterSize12,
        size16: .twitterSize16,
        size20: .twitterSize20,
        size24: .twitterSize24,
        size32: .twitterSize32
    )

    static let typography = FrostedIconSet(
        size12: .typography12,
        size16: .typography16,
        size20: .typography20,
        size24: .typography24,
        size32: .typography32
    )

    static let underline = FrostedIconSet(
        size12: .underline12,
        size16: .underline16,
        size20: .underline20,
        size24: .underline24,
        size32: .underline32
    )

    static let unpin = FrostedIconSet(
        size12: .unpin12,
        size16: .unpin16,
        size20: .unpin20,
        size24: .unpin24,
        size32: .unpin32
    )

    static let unpinFilled = FrostedIconSet(
        size12: .unpinFilled12,
        size16: .unpinFilled16,
        size20: .unpinFilled20,
        size24: .unpinFilled24,
        size32: .unpinFilled32
    )

    static let upinTilted = FrostedIconSet(
        size12: .upinTilted12,
        size16: .upinTilted16,
        size20: .upinTilted20,
        size24: .upinTilted24,
        size32: .upinTilted32
    )

    static let upinTiltedFilled = FrostedIconSet(
        size12: .upinTiltedFilled12,
        size16: .upinTiltedFilled16,
        size20: .upinTiltedFilled20,
        size24: .upinTiltedFilled24,
        size32: .upinTiltedFilled32
    )

    static let upload = FrostedIconSet(
        size12: .upload12,
        size16: .upload16,
        size20: .upload20,
        size24: .upload24,
        size32: .upload32
    )

    static let usd = FrostedIconSet(
        size12: .usd12,
        size16: .usd16,
        size20: .usd20,
        size24: .usd24,
        size32: .usd32
    )

    static let user = FrostedIconSet(
        size12: .user12,
        size16: .user16,
        size20: .user20,
        size24: .user24,
        size32: .user32
    )

    static let verifiedCheck = FrostedIconSet(
        size12: .verifiedCheck12,
        size16: .verifiedCheck16,
        size20: .verifiedCheck20,
        size24: .verifiedCheck24,
        size32: .verifiedCheck32
    )

    static let videoFilled = FrostedIconSet(
        size12: .videoFilled12,
        size16: .videoFilled16,
        size20: .videoFilled20,
        size24: .videoFilled24,
        size32: .videoFilled32
    )

    static let volumeHigh = FrostedIconSet(
        size12: .volumeHigh12,
        size16: .volumeHigh16,
        size20: .volumeHigh20,
        size24: .volumeHigh24,
        size32: .volumeHigh32
    )

    static let volumeLow = FrostedIconSet(
        size12: .volumeLow12,
        size16: .volumeLow16,
        size20: .volumeLow20,
        size24: .volumeLow24,
        size32: .volumeLow32
    )

    static let volumeOff = FrostedIconSet(
        size12: .volumeOff12,
        size16: .volumeOff16,
        size20: .volumeOff20,
        size24: .volumeOff24,
        size32: .volumeOff32
    )

    static let wallet = FrostedIconSet(
        size12: .wallet12,
        size16: .wallet16,
        size20: .wallet20,
        size24: .wallet24,
        size32: .wallet32
    )

    static let waveform = FrostedIconSet(
        size12: .waveform12,
        size16: .waveform16,
        size20: .waveform20,
        size24: .waveform24,
        size32: .waveform32
    )

    static let webcamOff = FrostedIconSet(
        size12: .webcamOff12,
        size16: .webcamOff16,
        size20: .webcamOff20,
        size24: .webcamOff24,
        size32: .webcamOff32
    )

    static let webcamOn = FrostedIconSet(
        size12: .webcamOn12,
        size16: .webcamOn16,
        size20: .webcamOn20,
        size24: .webcamOn24,
        size32: .webcamOn32
    )

    static let whopLogo = FrostedIconSet(
        size12: .whopLogo12,
        size16: .whopLogo16,
        size20: .whopLogo20,
        size24: .whopLogo24,
        size32: .whopLogo32
    )

    static let xCircle = FrostedIconSet(
        size12: .xCircle12,
        size16: .xCircle16,
        size20: .xCircle20,
        size24: .xCircle24,
        size32: .xCircle32
    )

    static let xCircleFilled = FrostedIconSet(
        size12: .xCircleFilled12,
        size16: .xCircleFilled16,
        size20: .xCircleFilled20,
        size24: .xCircleFilled24,
        size32: .xCircleFilled32
    )

    static let xCircleSize = FrostedIconSet(
        size12: .xCircleSize12,
        size16: .xCircleSize16,
        size20: .xCircleSize20,
        size24: .xCircleSize24,
        size32: .xCircleSize32
    )

    static let xDotCom = FrostedIconSet(
        size12: .xDotCom12,
        size16: .xDotCom16,
        size20: .xDotCom20,
        size24: .xDotCom24,
        size32: .xDotCom32
    )

    static let xDotComSize = FrostedIconSet(
        size12: .xDotComSize12,
        size16: .xDotComSize16,
        size20: .xDotComSize20,
        size24: .xDotComSize24,
        size32: .xDotComSize32
    )

    static let xMark = FrostedIconSet(
        size12: .xMark12,
        size16: .xMark16,
        size20: .xMark20,
        size24: .xMark24,
        size32: .xMark32
    )

    static let youtubeFilledSize = FrostedIconSet(
        size12: .youtubeFilledSize12,
        size16: .youtubeFilledSize16,
        size20: .youtubeFilledSize20,
        size24: .youtubeFilledSize24,
        size32: .youtubeFilledSize32
    )

    static let youtubeSize = FrostedIconSet(
        size12: .youtubeSize12,
        size16: .youtubeSize16,
        size20: .youtubeSize20,
        size24: .youtubeSize24,
        size32: .youtubeSize32
    )
}
