From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sat, 14 Jul 2012 16:43:02 +0000
Subject: [PATCH 0/6] ensure a consistent return value in error case
Message-Id: <1342284188-19176-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org

Typically, the return value desired for the failure of a function with an
integer return value is a negative integer.  In these cases, the return
value is sometimes a negative integer and sometimes 0, due to a subsequent
initialization of the return variable within the loop.

The semantic match that finds this problem is:
(http://coccinelle.lip6.fr/)

//<smpl>
@r exists@
identifier ret;
position p;
constant C;
expression e1,e2,e3,e4;
@@

ret = -C
... when != ret = e1
    when != ret += e1
    when any
if@p (...)
{
  ... when != ret = e2
      when != ret + e2
  return ret;
}
... when any
if (\(ret != 0\|ret < 0\|ret > 0\) || ...)
{
  ...
  return ...;
}
... when != ret = e3
    when != ret += e3
    when any
if@p (...)
{
  ... when != ret = e4
      when != ret += e4
  return ret;
}

@@
identifier r.ret;
position r.p;
statement S;
@@

(
if@p (<+...ret...+>) S
|
*if@p (...) S
)
//</smpl>

