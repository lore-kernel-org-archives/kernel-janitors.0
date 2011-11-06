From: Julia Lawall <julia@diku.dk>
Date: Sun, 06 Nov 2011 13:26:45 +0000
Subject: [PATCH 0/5] use kstrtoul, etc
Message-Id: <1320586010-21931-1-git-send-email-julia@diku.dk>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "David S. Miller" <davem@davemloft.net>
Cc: kernel-janitors@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org

These patches replace calls to strict_strtoul, etc by the corresponding
calls to kstrtoul.  The complete semantic patch that makes these changes is
as follows.  This semantic patch checks that the types are as expected,
which was always the case for these files.

// <smpl>
@@
expression a,b;
{int,long} *c;
@@

-strict_strtol
+kstrtol
 (a,b,c)

@@
expression a,b;
long long *c;
@@

-strict_strtoll
+kstrtoll
 (a,b,c)

@@
typedef ulong;
expression a,b;
{ulong,unsigned long,unsigned int,size_t} *c;
@@

-strict_strtoul
+kstrtoul
 (a,b,c)

@@
expression a,b;
unsigned long long *c;
@@

-strict_strtoull
+kstrtoull
 (a,b,c)

@@
expression a,b;
u64 *c;
@@

-strict_strtoull
+kstrtou64
 (a,b,c)

@@
@@

(
+BAD(
  strict_strtoull(...)
+)
|
+BAD(
  strict_strtoul(...)
+)
|
+BAD(
  strict_strtol(...)
+)
|
+BAD(
  strict_strtoll(...)
+)
)
// </smpl>

