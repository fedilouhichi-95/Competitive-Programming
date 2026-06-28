#define __USE_MINGW_ANSI_STDIO 1
#pragma GCC optimize("O2")
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <limits.h>
#include <stdbool.h>

// ─── Type aliases ───────────────────────────────────────────
typedef long long          ll;
typedef unsigned long long ull;
typedef struct { ll fi; ll se; } pair_t;

// ─── Constants ──────────────────────────────────────────────
#define INF        (ll)1e18
#define MOD        (ll)(1e9 + 7)
#define MOD2       998244353LL
#define PI         3.14159265358979323846
#define EPS        1e-9
#define MAXN       200005

// ─── Shortcuts ──────────────────────────────────────────────
#define rep(i,a,b)   for(ll i=(a);i<(b);i++)
#define per(i,a,b)   for(ll i=(a);i>=(b);i--)
#define max(a,b)     ((a)>(b)?(a):(b))
#define min(a,b)     ((a)<(b)?(a):(b))
#define swap(a,b)    do { __typeof__(a) _t = (a); (a) = (b); (b) = _t; } while(0)

// ─── Debug ──────────────────────────────────────────────────
#ifdef DEBUG
  #define dbg(fmt, ...) fprintf(stderr, "\033[36m[debug]\033[0m " fmt "\n", ##__VA_ARGS__)
  #define check(cond, msg) do { if(!(cond)) { fprintf(stderr, "\033[31m[ASSERT FAIL]\033[0m %s (%s) at %s:%d\n", msg, #cond, __FILE__, __LINE__); abort(); } } while(0)
#else
  #define dbg(fmt, ...) ((void)0)
  #define check(cond, msg) ((void)0)
#endif

// ─── Utilities ──────────────────────────────────────────────
ll power_mod(ll base, ll exp, ll mod) {
    ll res = 1; base %= mod;
    while(exp > 0) { if(exp & 1) res = res * base % mod; base = base * base % mod; exp >>= 1; }
    return res;
}

ll gcd(ll a, ll b) { while(b) { a %= b; swap(a, b); } return a; }
ll lcm(ll a, ll b) { return a / gcd(a, b) * b; }

int cmp_ll(const void *a, const void *b) {
    ll x = *(const ll*)a, y = *(const ll*)b;
    return (x > y) - (x < y);
}

// ─── Solution ───────────────────────────────────────────────
void solve(void) {
    
}

// ─── Main ───────────────────────────────────────────────────
int main(void) {
#ifndef ONLINE_JUDGE
    (void)!freopen("Input.txt",  "r", stdin);
    (void)!freopen("Output.txt", "w", stdout);
    (void)!freopen("Error.txt",  "w", stderr);
#endif

    int t = 1;
    // scanf("%d", &t);
    while(t--) solve();

    return 0;
}
