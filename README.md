# 이원 TODO

프로젝트와 일정을 함께 관리하는 공유형 TODO 웹앱입니다.

## 현재 구조

- 화면 배포: GitHub Pages
- 공동 데이터 저장: Supabase
- 앱 설치: PWA 방식
- 지원 환경: Windows, Mac, Chrome, Edge, Safari

## 중요한 안내

현재 버전은 개인용 잠금 버전입니다.
앱 주소를 알아도 Supabase Auth에 등록된 계정으로 로그인하지 않으면 데이터를 볼 수 없습니다.
기본 보안 정책은 `zzummm@naver.com` 계정만 데이터를 읽고 수정할 수 있게 설정되어 있습니다.

## Supabase 설정

1. Supabase 프로젝트를 엽니다.
2. 왼쪽 메뉴에서 `Authentication`을 엽니다.
3. `Users`에서 `Add user`를 눌러 `zzummm@naver.com` 계정을 만듭니다.
4. 왼쪽 메뉴에서 `SQL Editor`를 엽니다.
5. 이 저장소의 `supabase-schema.sql` 내용을 전체 복사합니다.
6. SQL Editor에 붙여넣고 실행합니다.
7. 앱을 새로고침한 뒤 만든 계정으로 로그인합니다.

처음 테이블이 비어 있으면 앱이 기본 사용자와 예시 프로젝트를 자동으로 생성합니다.

## GitHub Pages에 올리는 방법

1. GitHub에서 새 repository를 만듭니다.
2. 이 폴더의 파일을 모두 업로드합니다.
3. repository의 `Settings`로 이동합니다.
4. `Pages` 메뉴를 엽니다.
5. `Deploy from a branch`를 선택합니다.
6. branch는 `main`, folder는 `/root`를 선택합니다.
7. 저장하면 잠시 뒤 웹 주소가 생깁니다.

## 앱처럼 설치하는 방법

### Windows

1. GitHub Pages 주소를 Edge 또는 Chrome에서 엽니다.
2. 주소창 오른쪽의 설치 아이콘을 누릅니다.
3. `이원 TODO 설치`를 선택합니다.
4. 시작 메뉴에 앱처럼 추가됩니다.

### Mac

1. GitHub Pages 주소를 Safari 또는 Chrome에서 엽니다.
2. Safari에서는 공유 버튼에서 `Dock에 추가`를 선택합니다.
3. Chrome에서는 주소창 오른쪽 설치 아이콘 또는 메뉴의 설치 항목을 선택합니다.
4. Dock 또는 Launchpad에서 앱처럼 실행할 수 있습니다.

## 포함된 앱 아이콘

- `assets/icon.svg`
- `assets/icon-192.png`
- `assets/icon-512.png`

## 파일 구성

- `index.html`
- `styles.css`
- `app.js`
- `manifest.json`
- `sw.js`
- `supabase-schema.sql`
- `assets/`
