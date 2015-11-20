From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Fri, 20 Nov 2015 20:33:18 +0000
Subject: [PATCH 0/6] add missing of_node_put
Message-Id: <1448051604-25256-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: kernel-janitors@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org

The various for_each device_node iterators performs an of_node_get on each
iteration, so a break out of the loop requires an of_node_put.

The complete semantic patch that fixes this problem is
(http://coccinelle.lip6.fr):

// <smpl>
@r@
local idexpression n;
expression e1,e2;
iterator name for_each_node_by_name, for_each_node_by_type,
for_each_compatible_node, for_each_matching_node,
for_each_matching_node_and_match, for_each_child_of_node,
for_each_available_child_of_node, for_each_node_with_property;
iterator i;
statement S;
expression list [n1] es;
@@

(
(
for_each_node_by_name(n,e1) S
|
for_each_node_by_type(n,e1) S
|
for_each_compatible_node(n,e1,e2) S
|
for_each_matching_node(n,e1) S
|
for_each_matching_node_and_match(n,e1,e2) S
|
for_each_child_of_node(e1,n) S
|
for_each_available_child_of_node(e1,n) S
|
for_each_node_with_property(n,e1) S
)
&
i(es,n,...) S
)

@@
local idexpression r.n;
iterator r.i;
expression e;
expression list [r.n1] es;
@@

 i(es,n,...) {
   ...
(
   of_node_put(n);
|
   e = n
|
   return n;
|
+  of_node_put(n);
?  return ...;
)
   ...
 }

@@
local idexpression r.n;
iterator r.i;
expression e;
expression list [r.n1] es;
@@

 i(es,n,...) {
   ...
(
   of_node_put(n);
|
   e = n
|
+  of_node_put(n);
?  break;
)
   ...
 }
... when != n

@@
local idexpression r.n;
iterator r.i;
expression e;
identifier l;
expression list [r.n1] es;
@@

 i(es,n,...) {
   ...
(
   of_node_put(n);
|
   e = n
|
+  of_node_put(n);
?  goto l;
)
   ...
 }
...
l: ... when != n// </smpl>

---

 arch/powerpc/kernel/btext.c                   |    4 +++-
 arch/powerpc/kernel/machine_kexec_64.c        |    4 +++-
 arch/powerpc/platforms/cell/iommu.c           |    1 +
 arch/powerpc/platforms/embedded6xx/hlwd-pic.c |    1 +
 arch/powerpc/platforms/powernv/opal-lpc.c     |    1 +
 arch/powerpc/platforms/pseries/setup.c        |    3 ++-
 6 files changed, 11 insertions(+), 3 deletions(-)
