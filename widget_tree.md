# SkillSwap - Complete Flutter Widget Trees

This document outlines the complete widget tree hierarchy for every screen and flow in the **SkillSwap** project (`skillswap00`). It is organized by flow groups as defined in the app architecture and complements the reference in [`basic_flutter_widget.md`](./basic_flutter_widget.md).

---

## Table of Contents

1. [App Root Architecture](#1-app-root-architecture)
2. [Splash Flow](#2-splash-flow)
3. [Onboarding Flow](#3-onboarding-flow)
4. [Authentication (Auth) Flow](#4-authentication-auth-flow)
   - [Login Screen](#41-loginscreen)
   - [Sign Up Screen](#42-signupscreen)
   - [Forgot Password Screen](#43-forgotpasswordscreen)
   - [Verify Email Screen](#44-verifyemailscreen)
   - [Create New Password Screen](#45-createnewpasswordscreen)
   - [Email Verified Screen](#46-emailverifiedscreen)
5. [Main Dashboard Flow](#5-main-dashboard-flow)
   - [SkillSwap Dashboard (Root Shell)](#51-skillswapdashboard-root-shell)
   - [Tab 1: Home View](#52-homeview)
   - [Tab 2: Search View](#53-searchview)
   - [Tab 3: Calendar View](#54-calendarview)
   - [Tab 4: Profile View](#55-profileview)
6. [Swap & Mentorship Flow (Swapa)](#6-swap--mentorship-flow-swapa)
   - [Top Categories Screen](#61-topcategoriesscreen)
   - [Design Skills Screen](#62-designskillsscreen)
   - [Find Mentor Screen](#63-findmentorscreen)
   - [UI Designers Screen](#64-uidesignersscreen)
   - [Expert Profile Screen](#65-expertprofilescreen)
   - [Send Request Screen](#66-sendrequestscreen)
   - [My Requests Screen](#67-myrequestsscreen)
   - [Incoming Request Screen](#68-incomingrequestscreen)
   - [Schedule Screen](#69-schedulescreen)
   - [Session Details Screen](#610-sessiondetailsscreen)
   - [Edit Profile Screen](#611-editprofilescreen)
7. [Admin Panel Flow](#7-admin-panel-flow)
   - [Admin Panel Screen (Root Shell)](#71-adminpanelscreen-root-shell)
   - [Tab 1: Admin Dashboard View](#72-admindashboardview)
   - [Tab 2: Admin Users View (Details & Settings Frames)](#73-adminusersview)
   - [Tab 3: Admin Skills View](#74-adminskillsview)
   - [Tab 4: Admin Settings View](#75-adminsettingsview)
   - [Admin Quick Actions Sheet](#76-adminquickactionssheet)
   - [Admin Category Management Screen](#77-admincategorymanagementscreen)
   - [Admin Activity Log Screen](#78-adminactivitylogscreen)
8. [Master Screen & Widget Index](#8-master-screen--widget-index)

---

## 1. App Root Architecture

**File**: `skillswap00/lib/main.dart`

```
SkillSwapApp (StatelessWidget)
└── MaterialApp
    ├── ThemeData (Font: Roboto, Background: #F8FAFC, SeedColor: #7B61FF)
    └── home: SplashScreenView
```

---

## 2. Splash Flow

### 2.1 `SplashScreenView`
**File**: `skillswap00/lib/screens/splash/splash_screen.dart`  
**Purpose**: Branded launch screen displaying animated logo, emblem, title, and tagline with automatic timer transition to onboarding.

```
SplashScreenView (StatefulWidget)
└── Scaffold (backgroundColor: #7859FA)
    └── GestureDetector (onTap: _navigateToNext)
        └── SizedBox.expand
            └── Center
                └── Column (mainAxisSize: min)
                    ├── Container (Squircle Box with shadow & radius: 30)
                    │   └── Center
                    │       └── CustomPaint (Size: 74x74, painter: SkillSwapEmblemPainter)
                    ├── SizedBox (height: 26)
                    ├── Text ('SkillSwap', style: 34px Bold)
                    ├── SizedBox (height: 8)
                    └── Text ('Learn Together. Teach Together.', style: 15.5px)
```

---

## 3. Onboarding Flow

### 3.1 `OnboardingScreen`
**File**: `skillswap00/lib/screens/onboarding/onboarding_screen.dart`  
**Purpose**: 4-step interactive questionnaire setting up learning goals, interests, experience level, and user profile.

```
OnboardingScreen (StatefulWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── Column
            ├── SizedBox (height: 48) [Top Row: Skip Button / Spacer]
            │   └── Row (mainAxisAlignment: end)
            │       └── TextButton ('Skip' -> _skip)
            ├── Container (Logo Emblem, 56x56)
            │   └── CustomPaint (painter: SkillSwapEmblemPainter)
            ├── Expanded
            │   └── PageView (controller: _pageController)
            │       ├── _GoalStep (Step 1: Goal selection cards)
            │       │   └── Padding (horizontal: 24)
            │       │       └── Column
            │       │           ├── Text ('What is your goal?')
            │       │           ├── Text (subtitle)
            │       │           ├── _buildCard ('Learn a Skill', icon)
            │       │           ├── _buildCard ('Teach a Skill', icon)
            │       │           └── _buildCard ('Both', icon)
            │       ├── _InterestsStep (Step 2: Topic multi-select chips)
            │       │   └── Padding (horizontal: 24)
            │       │       └── Column
            │       │           ├── Text ('Pick your interests')
            │       │           ├── Text (subtitle)
            │       │           └── Wrap (chips with check icons)
            │       │               └── [GestureDetector -> AnimatedContainer -> Text, Icon]
            │       ├── _LevelStep (Step 3: Beginner / Intermediate / Expert)
            │       │   └── Padding (horizontal: 24)
            │       │       └── Column
            │       │           ├── Text ('What is your level?')
            │       │           ├── Text (subtitle)
            │       │           ├── _buildCard ('Beginner')
            │       │           ├── _buildCard ('Intermediate')
            │       │           └── _buildCard ('Expert')
            │       └── _ProfileStep (Step 4: Personal info fields)
            │           └── Padding (horizontal: 24)
            │               └── SingleChildScrollView
            │                   └── Column
            │                       ├── Text ('Tell us about yourself')
            │                       ├── Text (subtitle)
            │                       ├── _buildField ('Full Name *')
            │                       ├── _buildField ('Location')
            │                       └── _buildField ('Email *')
            ├── Row (_buildDots: Page indicator pills)
            │   └── List.generate (4) -> AnimatedContainer
            ├── SizedBox (height: 24)
            ├── Padding (horizontal: 24) [Bottom Action Button]
            │   └── SizedBox (height: 52)
            │       └── ElevatedButton ('Next' / 'Get Started' -> _nextPage)
            │           └── Row [Text, Icon(arrow_forward_rounded)]
            └── Row / SizedBox ('Already have an account? Log In' link)
```

---

## 4. Authentication (Auth) Flow

### 4.1 `LoginScreen`
**File**: `skillswap00/lib/screens/auth/login_screen.dart`  
**Purpose**: Email and password authentication with links to Forgot Password, Admin Panel, and Sign Up.

```
LoginScreen (StatelessWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── LayoutBuilder
            └── SingleChildScrollView (horizontal: 24)
                └── ConstrainedBox (minHeight: maxHeight)
                    └── IntrinsicHeight
                        └── Column (crossAxisAlignment: start)
                            ├── SizedBox (height: 24)
                            ├── buildIconBubble (Icons.badge_outlined)
                            ├── Text ('Welcome', style: 24px Bold)
                            ├── Text ('Sign in to continue...')
                            ├── buildField ('Email Address', icon: mail)
                            ├── buildField ('Password', isPassword: true)
                            ├── Align (alignment: centerRight)
                            │   └── GestureDetector (onTap -> ForgotPasswordScreen)
                            │       └── Text ('Forgot Password?')
                            ├── Spacer
                            ├── buildButton ('Login' -> SkillSwapDashboard)
                            ├── SizedBox (height: 10)
                            ├── OutlinedButton.icon ('Login as Admin' -> AdminPanelScreen)
                            ├── SizedBox (height: 16)
                            └── Row (mainAxisAlignment: center)
                                ├── Text ("Don't have an account? ")
                                └── GestureDetector (onTap -> SignUpScreen)
                                    └── Text ('Sign Up')
```

### 4.2 `SignUpScreen`
**File**: `skillswap00/lib/screens/auth/signup_screen.dart`  
**Purpose**: New user account creation with name, email, password confirmation, and link back to login.

```
SignUpScreen (StatelessWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── LayoutBuilder
            └── SingleChildScrollView (horizontal: 24)
                └── ConstrainedBox (minHeight: maxHeight)
                    └── IntrinsicHeight
                        └── Column (crossAxisAlignment: start)
                            ├── buildBackButton (Navigator.pop)
                            ├── buildIconBubble (Icons.person_add_outlined)
                            ├── Text ('Create Account', style: 24px Bold)
                            ├── Text ('Sign up to start your learning...')
                            ├── buildField ('Full Name', icon: person)
                            ├── buildField ('Email Address', icon: mail)
                            ├── buildField ('Password', isPassword: true)
                            ├── buildField ('Confirm Password', isPassword: true)
                            ├── Spacer
                            ├── buildButton ('Sign Up' -> SkillSwapDashboard)
                            └── Row (mainAxisAlignment: center)
                                ├── Text ("Already have an account? ")
                                └── GestureDetector (onTap -> Navigator.pop)
                                    └── Text ('Sign In')
```

### 4.3 `ForgotPasswordScreen`
**File**: `skillswap00/lib/screens/auth/forgot_password_screen.dart`  
**Purpose**: Password recovery email submission with tips and verification entry.

```
ForgotPasswordScreen (StatelessWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── LayoutBuilder
            └── SingleChildScrollView (horizontal: 24)
                └── ConstrainedBox (minHeight: maxHeight)
                    └── IntrinsicHeight
                        └── Column (crossAxisAlignment: start)
                            ├── buildBackButton (Navigator.pop)
                            ├── buildIconBubble (Icons.key_rounded)
                            ├── Text ('Forgot Password', style: 24px Bold)
                            ├── Text ('Enter your email below...')
                            ├── buildField ('Email Address', icon: mail)
                            ├── Container (Info notice with info_outline_rounded)
                            ├── Spacer
                            ├── buildButton ('Verify my Mail' -> VerifyEmailScreen)
                            └── Center
                                └── GestureDetector (onTap -> Navigator.pop)
                                    └── Text ('Back to Login')
```

### 4.4 `VerifyEmailScreen`
**File**: `skillswap00/lib/screens/auth/verify_email_screen.dart`  
**Purpose**: 6-digit OTP code input boxes and resend mechanism.

```
VerifyEmailScreen (StatelessWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── LayoutBuilder
            └── SingleChildScrollView (horizontal: 24)
                └── ConstrainedBox (minHeight: maxHeight)
                    └── IntrinsicHeight
                        └── Column (crossAxisAlignment: start)
                            ├── buildBackButton (Navigator.pop)
                            ├── buildIconBubble (Icons.key_rounded)
                            ├── Text ('Verify Email', style: 24px Bold)
                            ├── Text ('We have sent a 6-digit code...')
                            ├── Text ('Verification Code')
                            ├── Row (mainAxisAlignment: spaceBetween)
                            │   └── List.generate(6) -> Container (Boxed digit / cursor)
                            ├── Spacer
                            ├── buildButton ('Verify' -> CreateNewPasswordScreen)
                            └── Column
                                ├── Text ("Didn't receive the code?")
                                └── GestureDetector (Text: 'Resend')
```

### 4.5 `CreateNewPasswordScreen`
**File**: `skillswap00/lib/screens/auth/create_new_password_screen.dart`  
**Purpose**: Set and confirm new account credentials.

```
CreateNewPasswordScreen (StatelessWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── LayoutBuilder
            └── SingleChildScrollView (horizontal: 24)
                └── ConstrainedBox (minHeight: maxHeight)
                    └── IntrinsicHeight
                        └── Column (crossAxisAlignment: start)
                            ├── buildBackButton (Navigator.pop)
                            ├── buildIconBubble (Icons.key_rounded)
                            ├── Text ('Create New Password', style: 24px Bold)
                            ├── Text ('Your new password must be different...')
                            ├── buildField ('New Password', isPassword: true)
                            ├── buildField ('Confirm Password', isPassword: true)
                            ├── Spacer
                            └── buildButton ('Set Password' -> EmailVerifiedScreen)
```

### 4.6 `EmailVerifiedScreen`
**File**: `skillswap00/lib/screens/auth/email_verified_screen.dart`  
**Purpose**: Confirmation success checkmark screen completing recovery or verification.

```
EmailVerifiedScreen (StatelessWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── Padding (horizontal: 24)
            └── Column (mainAxisAlignment: center)
                ├── Spacer (flex: 2)
                ├── Container (Double circular pulse badge with Icons.check)
                ├── Text ('Email Verified!', style: 24px Bold)
                ├── Text ('Your email has been successfully verified...')
                ├── Spacer (flex: 2)
                └── buildButton ('Go to Home' -> SkillSwapDashboard)
```

---

## 5. Main Dashboard Flow

### 5.1 `SkillSwapDashboard` (Root Shell)
**File**: `skillswap00/lib/screens/dashboard/dashboard_screen.dart`  
**Purpose**: Central hub containing the floating bottom pill navigation and tab switcher.

```
SkillSwapDashboard (StatefulWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── Body: Stack
        ├── IndexedStack (index: _navIndex)
        │   ├── 0: HomeView
        │   ├── 1: SearchView
        │   ├── 2: CalendarView
        │   └── 3: ProfileView
        └── Positioned (bottom: 24, left: 24, right: 24) [Floating Nav Pill]
            └── Container (height: 72, radius: 36, shadow)
                └── Row (mainAxisAlignment: spaceEvenly)
                    ├── _buildNavItem (Home, index: 0)
                    ├── _buildNavItem (Search, index: 1)
                    ├── _buildNavItem (Calendar, index: 2)
                    └── _buildNavItem (Profile, index: 3)
```

### 5.2 `HomeView`
**File**: `skillswap00/lib/screens/dashboard/views/home_view.dart`  
**Purpose**: Primary landing feed featuring greeting, categories, featured masterclass banner, top mentors, and upcoming sessions.

```
HomeView (StatelessWidget)
└── SafeArea
    └── SingleChildScrollView (padding: bottom: 120)
        └── Column (crossAxisAlignment: start)
            ├── Padding (Greeting: "Good morning, Hello Pheonix!")
            ├── _buildSectionHeader ('Categories', action: 'See All' -> TopCategoriesScreen)
            ├── Row (Category Quick Chips: Design, Coding, Photo, Music)
            ├── _buildFeaturedCard (UI/UX Design Masterclass banner)
            │   └── Container (Border, background image/graphic, author, Join button)
            ├── _buildSectionHeader ('Top Mentors', action: 'View All' -> FindMentorScreen)
            ├── SizedBox (height: 120)
            │   └── ListView.separated (horizontal: true)
            │       └── _buildMentorAvatarCard (Avatar, Name, Rating -> ExpertProfileScreen)
            ├── _buildSectionHeader ('Upcoming Sessions', action: 'My Schedule' -> ScheduleScreen)
            ├── _buildUpcomingSessionCard ('Branding Workshop', SEP 14)
            │   └── Row [Date Badge, Column(Title, Time), Join Button (SnackBar with safe margin)]
            └── _buildUpcomingSessionCard ('Advanced Python API', SEP 15)
                └── Row [Date Badge, Column(Title, Time), Details Button -> SessionDetailsScreen]
```

### 5.3 `SearchView`
**File**: `skillswap00/lib/screens/dashboard/views/search_view.dart`  
**Purpose**: Search interface for discovering skills, mentors, filter tabs, and trending topics.

```
SearchView (StatelessWidget)
└── SafeArea
    └── SingleChildScrollView (padding: bottom: 120)
        └── Column (crossAxisAlignment: start)
            ├── Padding (Search Input Bar with filter icon)
            │   └── Container -> TextField ('Search skills or mentors...')
            ├── _buildFilterTabs ('All', 'Design', 'Coding', 'Languages', 'Music')
            │   └── SizedBox (height: 40) -> ListView.builder (horizontal: true)
            ├── _buildSectionHeader ('Top Categories', 'View All' -> TopCategoriesScreen)
            ├── GridView.count / Row (Category cards with icon, title, count)
            ├── _buildSectionHeader ('Featured Mentors', 'See More' -> UIDesignersScreen)
            └── Column (Vertical mentor cards with ratings, skills chips, and Connect button)
```

### 5.4 `CalendarView`
**File**: `skillswap00/lib/screens/dashboard/views/calendar_view.dart`  
**Purpose**: Interactive monthly calendar grid, day picker, and chronological schedule of confirmed sessions.

```
CalendarView (StatefulWidget)
└── SafeArea
    └── SingleChildScrollView (padding: bottom: 120)
        └── Column (crossAxisAlignment: start)
            ├── Padding [Header: "Calendar" + EditProfile avatar button]
            ├── Container (Month Selector & Header: "< September 2024 >")
            ├── Container (Calendar Grid Table)
            │   ├── Row (Weekday initials: S, M, T, W, T, F, S)
            │   └── GridView.builder (Days of month with event dot indicators & active selection)
            ├── _buildSectionHeader ('Scheduled Sessions', 'Filter')
            └── ListView.separated (shrinkWrap: true, physics: NeverScrollable)
                └── _buildSessionTimelineCard
                    └── Row [Timeline indicator, Container(Session card: title, mentor, time, duration)]
```

### 5.5 `ProfileView`
**File**: `skillswap00/lib/screens/dashboard/views/profile_view.dart`  
**Purpose**: Personal user dashboard showing profile header, badges, stats, swap requests shortcut, skills offered/wanted, and settings.

```
ProfileView (StatelessWidget)
└── SafeArea
    └── SingleChildScrollView (padding: bottom: 120)
        └── Column
            ├── Padding [Top bar: Title "Profile", Settings / Edit button -> EditProfileScreen]
            ├── Center [Avatar container with edit badge, Name, Role, Location]
            ├── Container [Stats Strip: Swaps Completed (18), Rating (4.9), Reviews (32)]
            ├── Padding [Shortcut button: "My Swap Requests" -> MyRequestsScreen]
            ├── _buildSectionHeader ('Skills I Teach')
            │   └── Wrap [Skill chips: UI Design, Figma, Design Systems]
            ├── _buildSectionHeader ('Skills I Want to Learn')
            │   └── Wrap [Skill chips: Python, Flutter, Guitar]
            └── _buildSectionHeader ('Recent Reviews')
                └── ListView.separated (Review items with 5-star ratings & user comments)
```

---

## 6. Swap & Mentorship Flow (Swapa)

### 6.1 `TopCategoriesScreen`
**File**: `skillswap00/lib/screens/skills/top_categories_screen.dart`  
**Purpose**: Category browser with real-time search filtering across Design, Coding, Marketing, Business, and more.

```
TopCategoriesScreen (StatefulWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── Column
            ├── Padding [Header: Back Button + Title: "Top Categories"]
            ├── Padding [Search Bar: TextField('Search categories...')]
            └── Expanded
                └── GridView.builder (crossAxisCount: 2, padding: 24)
                    └── CategoryCard (onTap -> DesignSkillsScreen)
                        └── Container (Border, icon container, title, skill count)
```

### 6.2 `DesignSkillsScreen`
**File**: `skillswap00/lib/screens/skills/design_skills_screen.dart`  
**Purpose**: Sub-skills catalog within a category (e.g., UI/UX, Design Systems, Typography, Motion).

```
DesignSkillsScreen (StatelessWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── Column
            ├── Padding [Top bar: Back button + Category title + Search icon]
            ├── Padding [Category banner with gradient and skill count]
            └── Expanded
                └── ListView.separated (padding: 24)
                    └── SkillTopicCard (Title, mentor count, learners count, icon -> UIDesignersScreen)
```

### 6.3 `FindMentorScreen`
**File**: `skillswap00/lib/screens/mentors/find_mentor_screen.dart`  
**Purpose**: Dedicated search and discovery list of mentors with filter chips and rating summaries.

```
FindMentorScreen (StatelessWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── Column
            ├── Padding [Back Button + Title: "Find Mentors" + Filter Action]
            ├── Padding [Search Bar]
            ├── SizedBox (Filter categories row)
            └── Expanded
                └── ListView.builder (padding: 24)
                    └── MentorListingCard (Avatar, Name, Speciality, Rating, Reviews -> ExpertProfileScreen)
```

### 6.4 `UIDesignersScreen`
**File**: `skillswap00/lib/screens/mentors/ui_designers_screen.dart`  
**Purpose**: Filtered directory of UI/UX specialists with availability indicators.

```
UIDesignersScreen (StatelessWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── Column
            ├── Padding [Back Button + Title: "UI Designers"]
            └── Expanded
                └── ListView.separated
                    └── ExpertCard (Avatar, Name, Hourly/Session details, View Profile button -> ExpertProfileScreen)
```

### 6.5 `ExpertProfileScreen`
**File**: `skillswap00/lib/screens/mentors/expert_profile_screen.dart`  
**Purpose**: Deep-dive profile page of an expert/mentor with bio, skills, portfolio preview, reviews, and swap request CTA.

```
ExpertProfileScreen (StatelessWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── Stack
            ├── SingleChildScrollView (padding: bottom: 90)
            │   └── Column (crossAxisAlignment: start)
            │       ├── Padding [Top Bar: Back button, Title, Share button]
            │       ├── Center [Expert Avatar, Name, Verified Badge, Role, Location]
            │       ├── Padding [Stats Row: Experience, Swaps, Rating]
            │       ├── Padding [Bio section: "About Me"]
            │       ├── Padding [Skills Offered chips]
            │       ├── Padding [Skills Wanted chips]
            │       └── Padding [Reviews list]
            └── Positioned (bottom: 20, left: 24, right: 24)
                └── SizedBox (height: 52)
                    └── ElevatedButton ('Request Skill Swap' -> SendRequestScreen)
```

### 6.6 `SendRequestScreen`
**File**: `skillswap00/lib/screens/requests/send_request_screen.dart`  
**Purpose**: Interactive swap proposal form where user picks which skill they offer in exchange for the mentor's skill.

```
SendRequestScreen (StatefulWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── Column
            ├── Padding [Back Button + Title: "Send Swap Request"]
            ├── Expanded
            │   └── SingleChildScrollView (padding: 24)
            │       └── Column
            │           ├── Text ('Select Skill You Want to Learn')
            │           ├── Dropdown / Option Selector
            │           ├── Text ('Select Skill You Can Teach in Return')
            │           ├── Radio/Checklist of user's taught skills
            │           ├── Text ('Add a Note / Proposed Schedule')
            │           └── TextField (multiline: 4)
            └── Padding (bottom: 24, horizontal: 24)
                └── ElevatedButton ('Submit Request' -> SnackBar & Pop)
```

### 6.7 `MyRequestsScreen`
**File**: `skillswap00/lib/screens/requests/my_requests_screen.dart`  
**Purpose**: Tabbed view of Sent and Received swap proposals with status indicators (Pending, Accepted, Declined).

```
MyRequestsScreen (StatefulWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── Column
            ├── Padding [Back Button + Title: "My Requests"]
            ├── Padding [TabBar / Segmented Control: "Received (3)" | "Sent (2)"]
            └── Expanded
                └── TabBarView
                    ├── Tab 1: Received Requests List
                    │   └── ListView.separated -> RequestCard (Accept/Decline buttons -> IncomingRequestScreen)
                    └── Tab 2: Sent Requests List
                        └── ListView.separated -> RequestCard (Status badge: Pending, Accepted)
```

### 6.8 `IncomingRequestScreen`
**File**: `skillswap00/lib/screens/requests/incoming_request_screen.dart`  
**Purpose**: Proposal review modal/page to evaluate incoming swap terms and confirm or negotiate.

```
IncomingRequestScreen (StatefulWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── Column
            ├── Padding [Back Button + Title: "Swap Proposal"]
            ├── Expanded
            │   └── SingleChildScrollView (padding: 24)
            │       └── Column
            │           ├── Mentor / Sender profile summary card
            │           ├── Swap Match Card [Sender Teaches <-> You Teach]
            │           ├── Note / Message box
            │           └── Proposed Date & Time picker
            └── Padding (horizontal: 24, bottom: 24)
                └── Row [OutlinedButton('Decline'), SizedBox(12), ElevatedButton('Accept Swap')]
```

### 6.9 `ScheduleScreen`
**File**: `skillswap00/lib/screens/sessions/schedule_screen.dart`  
**Purpose**: Full calendar and session list with interactive rescheduling and video room connectors.

```
ScheduleScreen (StatefulWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── Column
            ├── Padding [Back Button + Title: "My Schedule" + Add Event Icon]
            ├── Container [Week Calendar Strip: Day items (S, M, T, W, T, F, S)]
            └── Expanded
                └── ListView.builder (padding: 24)
                    └── ScheduleEventCard
                        └── Container
                            ├── Row [Time Badge, Status Chip]
                            ├── Text (Event Title)
                            ├── Text (Participant Name & Role)
                            └── Row [Reschedule Button, Join Video Button (SnackBar with Expanded text)]
```

### 6.10 `SessionDetailsScreen`
**File**: `skillswap00/lib/screens/sessions/session_details_screen.dart`  
**Purpose**: Comprehensive session overview with meeting link, prep notes, participant details, and cancel modal.

```
SessionDetailsScreen (StatelessWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── SingleChildScrollView (padding: 24)
            └── Column (crossAxisAlignment: start)
                ├── Row [Back Button, Title: "Session Details", More Options]
                ├── Container (Session Header Card: Title, Status Badge, Date, Duration)
                ├── Container (Participant Card: Avatar, Name, Role, Message CTA)
                ├── Text ('Meeting Details')
                ├── Container (Platform: Zoom/Google Meet, URL link, Copy link button)
                ├── Row [Action Button: Join Video (SnackBar), Action Button: Reschedule]
                └── Center [TextButton: "Cancel Session" -> Confirmation Dialog]
```

### 6.11 `EditProfileScreen`
**File**: `skillswap00/lib/screens/profile/edit_profile_screen.dart`  
**Purpose**: User account customization: avatar photo upload, bio, skills taught, skills wanted, and social links.

```
EditProfileScreen (StatefulWidget)
└── Scaffold (backgroundColor: Colors.white)
    └── SafeArea
        └── Column
            ├── Padding [Back Button + Title: "Edit Profile" + Save Action Button]
            └── Expanded
                └── SingleChildScrollView (padding: 24)
                    └── Column
                        ├── Center [Avatar with camera upload overlay icon]
                        ├── buildFormField ('Full Name')
                        ├── buildFormField ('Headline / Role')
                        ├── buildFormField ('Location')
                        ├── buildFormField ('Bio', maxLines: 4)
                        ├── Text ('Skills I Teach (Tags)')
                        ├── Wrap (Chips with remove 'x' buttons + Add Chip button)
                        ├── Text ('Skills I Want to Learn (Tags)')
                        └── Wrap (Chips with remove 'x' buttons + Add Chip button)
```

---

## 7. Admin Panel Flow

### 7.1 `AdminPanelScreen` (Root Shell)
**File**: `skillswap00/lib/screens/admin/admin_panel_screen.dart`  
**Purpose**: Admin management container housing IndexedStack for views and a specialized floating dock with quick action sheet launcher.

```
AdminPanelScreen (StatefulWidget)
└── Scaffold (backgroundColor: #F8FAFC)
    └── Body: Stack
        ├── IndexedStack (index: _currentIndex)
        │   ├── 0: AdminDashboardView
        │   ├── 1: AdminUsersView
        │   ├── 2: AdminSkillsView
        │   └── 3: AdminSettingsView
        └── Positioned (bottom: safeArea + 12, left: 16, right: 16) [Floating Dock]
            └── Container (height: 64, radius: 24, dark background)
                └── Row (mainAxisAlignment: spaceAround)
                    ├── Tab 0: Icons.home_rounded (Dashboard)
                    ├── Tab 1: Icons.people_alt_rounded (Users)
                    ├── Floating Center FAB: Icons.add (triggers AdminQuickActionsSheet)
                    ├── Tab 2: Icons.layers_rounded (Skills)
                    └── Tab 3: Icons.settings_rounded (Settings)
```

### 7.2 `AdminDashboardView`
**File**: `skillswap00/lib/screens/admin/admin_dashboard_view.dart`  
**Purpose**: System-wide executive dashboard with 2x2 KPI metrics, recent activity timeline, and quick shortcuts.

```
AdminDashboardView (StatelessWidget)
└── SafeArea
    └── SingleChildScrollView (padding: bottom: 120)
        └── Column (crossAxisAlignment: start)
            ├── AdminTopBar (Logo, Title, Admin Avatar)
            ├── Padding (Greeting banner)
            ├── Padding [2x2 Stat Cards Grid]
            │   ├── Row 1 [Total Users (2,482), Active Swaps (73)]
            │   └── Row 2 [Total Mentors (326), New Signups (24)]
            ├── Padding [Section: "Recent Platform Activity"]
            └── ListView.separated (activity items: new registrations, swap completions, flags)
```

### 7.3 `AdminUsersView`
**File**: `skillswap00/lib/screens/admin/admin_users_view.dart`  
**Purpose**: Dual-frame user management module containing a searchable user directory and an individual user settings/permission inspector.

```
AdminUsersView (StatefulWidget)
└── Frame Selector: if (_showingSettings) UserSettingsFrame else UserDetailsFrame

[FRAME 1: User Details Frame]
└── SafeArea
    └── SingleChildScrollView (padding: bottom: 140)
        └── Column (crossAxisAlignment: start)
            ├── AdminTopBar
            ├── Padding [Title: "User Details"]
            ├── Padding [Search Bar + Filter Modal Button]
            ├── Padding [Stat Cards: TOTAL USERS (2,482) & ACTIVE TODAY (204)]
            │   └── Row (Expanded cards with FittedBox and flexible text)
            ├── Padding [Section: "Recent Users" + Badge: "Showing 120"]
            └── ListView.separated (User item cards)
                └── InkWell (onTap -> switch to UserSettingsFrame)
                    └── Row
                        ├── CircleAvatar
                        ├── Expanded -> Column
                        │   ├── Row [Flexible(Name), Badge(Active/Pending/Suspended)]
                        │   ├── Text (email)
                        │   └── Row [Calendar Icon, Joined Date]
                        └── IconButton (More actions popup sheet)

[FRAME 2: User Settings Frame]
└── SafeArea
    └── SingleChildScrollView (padding: bottom: 120)
        └── Column (crossAxisAlignment: start)
            ├── AdminTopBar
            ├── Back Button ('< User Details' -> _showingSettings = false)
            ├── Padding [Title: "User Settings"]
            ├── Section Header: 'ACCOUNT CONTROL'
            │   └── Container (Tiles: Profile Information, Change Password)
            ├── Section Header: 'PLATFORM MANAGEMENT'
            │   └── Container (Tiles: Maintenance Mode switch, Verification status)
            └── Section Header: 'DANGER ZONE'
                └── Container (Tiles: Suspend User, Delete Account)
```

### 7.4 `AdminSkillsView`
**File**: `skillswap00/lib/screens/admin/admin_skills_view.dart`  
**Purpose**: Skill moderation screen with approval toggles, category tags, and creation modal.

```
AdminSkillsView (StatefulWidget)
└── SafeArea
    └── SingleChildScrollView (padding: bottom: 120)
        └── Column
            ├── AdminTopBar
            ├── Padding [Title: "Skills Moderation" + Add Skill Button]
            ├── Padding [Search Bar & Filter Tabs: All, Approved, Pending, Flagged]
            └── ListView.builder
                └── SkillModerationCard
                    └── Row [Icon/Emblem, Column(Skill Name, Category, Mentor count), Switch/Menu]
```

### 7.5 `AdminSettingsView`
**File**: `skillswap00/lib/screens/admin/admin_settings_view.dart`  
**Purpose**: Platform configuration console covering security, backups, theme toggles, and notification settings.

```
AdminSettingsView (StatefulWidget)
└── SafeArea
    └── SingleChildScrollView (padding: bottom: 120)
        └── Column
            ├── AdminTopBar
            ├── Padding [Title: "Platform Settings"]
            ├── Section: General Configuration
            ├── Section: Security & Authentication
            ├── Section: Data & Backup
            └── Section: Admin Profile & Logout
```

### 7.6 `AdminQuickActionsSheet`
**File**: `skillswap00/lib/screens/admin/admin_quick_actions_sheet.dart`  
**Purpose**: Modal bottom sheet invoked from the admin navigation dock providing shortcuts to common tasks.

```
AdminQuickActionsSheet (StatelessWidget)
└── Container (radius: 28, padding: 24, white background)
    └── Column (mainAxisSize: min)
        ├── Center [Grab handle bar]
        ├── Text ('Quick Actions', style: 18px Bold)
        ├── Row [Action Tile 1: Add User, Action Tile 2: Add Skill]
        ├── Row [Action Tile 3: Category Mgmt, Action Tile 4: View Logs]
        └── SizedBox (height: 12)
```

### 7.7 `AdminCategoryManagementScreen`
**File**: `skillswap00/lib/screens/admin/admin_category_management_screen.dart`  
**Purpose**: Manage top-level skill taxonomies (create category, rename, change icon, archive).

```
AdminCategoryManagementScreen (StatefulWidget)
└── Scaffold (backgroundColor: #F8FAFC)
    └── SafeArea
        └── Column
            ├── Padding [Back Button + Title: "Category Management" + Create Button]
            └── Expanded
                └── ListView.separated
                    └── CategoryManagementTile (Drag handle, Icon, Name, Count, Actions)
```

### 7.8 `AdminActivityLogScreen`
**File**: `skillswap00/lib/screens/admin/admin_activity_log_screen.dart`  
**Purpose**: Audit log tracking administrative actions, user logins, and swap transactions.

```
AdminActivityLogScreen (StatelessWidget)
└── Scaffold (backgroundColor: #F8FAFC)
    └── SafeArea
        └── Column
            ├── Padding [Back Button + Title: "Activity Log" + Filter Button]
            └── Expanded
                └── ListView.builder (Log entry cards with timestamps, actor, and status tags)
```

---

## 8. Master Screen & Widget Index

| Screen Name | File Path | Primary Container | Navigation / Trigger |
|---|---|---|---|
| **SkillSwapApp** | `lib/main.dart` | `MaterialApp` | App Entry Point |
| **SplashScreenView** | `lib/screens/splash/splash_screen.dart` | `Scaffold` | Initial screen (auto timer) |
| **OnboardingScreen** | `lib/screens/onboarding/onboarding_screen.dart` | `Scaffold` -> `PageView` | After Splash / First Launch |
| **LoginScreen** | `lib/screens/auth/login_screen.dart` | `Scaffold` -> `SingleChildScrollView` | Onboarding completion / Sign Out |
| **SignUpScreen** | `lib/screens/auth/signup_screen.dart` | `Scaffold` -> `SingleChildScrollView` | "Sign Up" from Login |
| **ForgotPasswordScreen** | `lib/screens/auth/forgot_password_screen.dart` | `Scaffold` -> `SingleChildScrollView` | "Forgot Password?" from Login |
| **VerifyEmailScreen** | `lib/screens/auth/verify_email_screen.dart` | `Scaffold` -> `SingleChildScrollView` | "Verify my Mail" from Forgot Password |
| **CreateNewPasswordScreen** | `lib/screens/auth/create_new_password_screen.dart` | `Scaffold` -> `SingleChildScrollView` | "Verify" from Verify Email |
| **EmailVerifiedScreen** | `lib/screens/auth/email_verified_screen.dart` | `Scaffold` -> `Column` | "Set Password" from Create New Password |
| **SkillSwapDashboard** | `lib/screens/dashboard/dashboard_screen.dart` | `Scaffold` -> `Stack` -> `IndexedStack` | Login / Home destination |
| **HomeView** | `lib/screens/dashboard/views/home_view.dart` | `SafeArea` -> `SingleChildScrollView` | Dashboard Tab 0 |
| **SearchView** | `lib/screens/dashboard/views/search_view.dart` | `SafeArea` -> `SingleChildScrollView` | Dashboard Tab 1 |
| **CalendarView** | `lib/screens/dashboard/views/calendar_view.dart` | `SafeArea` -> `SingleChildScrollView` | Dashboard Tab 2 |
| **ProfileView** | `lib/screens/dashboard/views/profile_view.dart` | `SafeArea` -> `SingleChildScrollView` | Dashboard Tab 3 |
| **TopCategoriesScreen** | `lib/screens/skills/top_categories_screen.dart` | `Scaffold` -> `GridView` | "See All" Categories from Home/Search |
| **DesignSkillsScreen** | `lib/screens/skills/design_skills_screen.dart` | `Scaffold` -> `ListView` | Category card tap |
| **FindMentorScreen** | `lib/screens/mentors/find_mentor_screen.dart` | `Scaffold` -> `ListView` | "View All" Mentors from Home |
| **UIDesignersScreen** | `lib/screens/mentors/ui_designers_screen.dart` | `Scaffold` -> `ListView` | Sub-category skill tap |
| **ExpertProfileScreen** | `lib/screens/mentors/expert_profile_screen.dart` | `Scaffold` -> `Stack` | Mentor item tap |
| **SendRequestScreen** | `lib/screens/requests/send_request_screen.dart` | `Scaffold` -> `SingleChildScrollView` | "Request Skill Swap" from Expert Profile |
| **MyRequestsScreen** | `lib/screens/requests/my_requests_screen.dart` | `Scaffold` -> `TabBarView` | Profile shortcut |
| **IncomingRequestScreen** | `lib/screens/requests/incoming_request_screen.dart` | `Scaffold` -> `SingleChildScrollView` | Request card action |
| **ScheduleScreen** | `lib/screens/sessions/schedule_screen.dart` | `Scaffold` -> `ListView` | "My Schedule" from Home |
| **SessionDetailsScreen** | `lib/screens/sessions/session_details_screen.dart` | `Scaffold` -> `SingleChildScrollView` | Session card tap |
| **EditProfileScreen** | `lib/screens/profile/edit_profile_screen.dart` | `Scaffold` -> `SingleChildScrollView` | Profile edit button |
| **AdminPanelScreen** | `lib/screens/admin/admin_panel_screen.dart` | `Scaffold` -> `Stack` -> `IndexedStack` | "Login as Admin" from Login |
| **AdminDashboardView** | `lib/screens/admin/admin_dashboard_view.dart` | `SafeArea` -> `SingleChildScrollView` | Admin Tab 0 |
| **AdminUsersView** | `lib/screens/admin/admin_users_view.dart` | `SafeArea` -> `SingleChildScrollView` | Admin Tab 1 |
| **AdminSkillsView** | `lib/screens/admin/admin_skills_view.dart` | `SafeArea` -> `SingleChildScrollView` | Admin Tab 2 |
| **AdminSettingsView** | `lib/screens/admin/admin_settings_view.dart` | `SafeArea` -> `SingleChildScrollView` | Admin Tab 3 |
| **AdminQuickActionsSheet** | `lib/screens/admin/admin_quick_actions_sheet.dart` | `Container` -> `Column` | Admin Dock Center "+" FAB |
| **AdminCategoryManagementScreen** | `lib/screens/admin/admin_category_management_screen.dart` | `Scaffold` -> `ListView` | Quick Action / Admin setting |
| **AdminActivityLogScreen** | `lib/screens/admin/admin_activity_log_screen.dart` | `Scaffold` -> `ListView` | Quick Action / Admin dashboard |
