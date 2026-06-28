#pragma GCC optimize("O2")
#pragma GCC optimize("unroll-loops")
#include <bits/stdc++.h>
using namespace std;

// ─── Type aliases ───────────────────────────────────────────
#define int            long long
#define pii            pair<int,int>
#define vi             vector<int>
#define vvi            vector<vi>
#define vpii           vector<pii>

// ─── Shortcuts ──────────────────────────────────────────────
#define pb             push_back
#define eb             emplace_back
#define mp             make_pair
#define fi             first
#define se             second
#define all(x)         (x).begin(), (x).end()
#define rall(x)        (x).rbegin(), (x).rend()
#define sz(x)          (int)(x).size()
#define rep(i,a,b)     for(int i=(a);i<(b);i++)
#define per(i,a,b)     for(int i=(a);i>=(b);i--)

// ─── Constants ──────────────────────────────────────────────
const int INF  = 1e18;
const int MOD  = 1e9 + 7;
const int MOD2 = 998244353;
const double PI = acos(-1.0);
const double EPS = 1e-9;
const int dx[] = {0, 0, 1, -1, 1, 1, -1, -1};
const int dy[] = {1, -1, 0, 0, 1, -1, 1, -1};

// ─── Debug ──────────────────────────────────────────────────
#ifdef DEBUG
  template<typename A, typename B>
  ostream& operator<<(ostream& os, const pair<A,B>& p) {
      return os << "(" << p.fi << ", " << p.se << ")";
  }
  template<typename T>
  ostream& operator<<(ostream& os, const vector<T>& v) {
      os << "["; for(int i = 0; i < sz(v); i++) os << (i ? ", " : "") << v[i]; return os << "]";
  }
  template<typename T>
  ostream& operator<<(ostream& os, const set<T>& s) {
      os << "{"; bool f = 0; for(auto& x : s) { if(f) os << ", "; os << x; f = 1; } return os << "}";
  }
  template<typename K, typename V>
  ostream& operator<<(ostream& os, const map<K,V>& m) {
      os << "{"; bool f = 0; for(auto& [k,v] : m) { if(f) os << ", "; os << k << ":" << v; f = 1; } return os << "}";
  }
  #define dbg(...)  cerr << "\033[36m[" << #__VA_ARGS__ << "]\033[0m = "; _dbg(__VA_ARGS__)
  void _dbg() { cerr << endl; }
  template<typename H, typename... T>
  void _dbg(H h, T... t) { cerr << h; if(sizeof...(t)) cerr << ", "; _dbg(t...); }
  #define check(cond, msg) do { if(!(cond)) { cerr << "\033[31m[ASSERT FAIL]\033[0m " << msg << " (" << #cond << ") at " << __FILE__ << ":" << __LINE__ << endl; abort(); } } while(0)
#else
  #define dbg(...)       ((void)0)
  #define check(cond,msg) ((void)0)
#endif

// ─── Utilities ──────────────────────────────────────────────
int power(int base, int exp, int mod = MOD) {
    int res = 1; base %= mod;
    while(exp > 0) { if(exp & 1) res = res * base % mod; base = base * base % mod; exp >>= 1; }
    return res;
}

int inv(int a, int mod = MOD) { return power(a, mod - 2, mod); }

// ─── Solution ───────────────────────────────────────────────
void solve() {
    
}

// ─── Main ───────────────────────────────────────────────────
int32_t main() {
#ifndef ONLINE_JUDGE
    (void)!freopen("Input.txt",  "r", stdin);
    (void)!freopen("Output.txt", "w", stdout);
    (void)!freopen("Error.txt",  "w", stderr);
#endif
    ios_base::sync_with_stdio(false);
    cin.tie(nullptr);

    int t = 1;
    // cin >> t;
    while(t--) solve();

    return 0;
}
