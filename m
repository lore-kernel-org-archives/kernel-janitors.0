From: Julia Lawall <Julia.Lawall@lip6.fr>
Date: Sun, 25 Oct 2015 21:24:24 +0000
Subject: [PATCH 0/1] drop unneeded of_node_get
Message-Id: <1445808265-10394-1-git-send-email-Julia.Lawall@lip6.fr>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>, Russell King - ARM Linux <linux@arm.linux.org.uk>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Andrew Lunn <andrew@lunn.ch>, Bjorn Helgaas <bhelgaas@google.com>, Jason Cooper <jason@lakedaemon.net>

for_each_child_of_node performs an of_node_get on each iteration, so no
of_node_get is needed on breaking out of the loop when the device_node
structure is saved in another variable.

The complete semantic match that finds this problem is
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
expression list [r.n1] es;
@@

 i(es,n,...) {
   <...
*  return (of_node_get(n));
   ...>
 }

@@
local idexpression r.n;
iterator r.i;
expression list [r.n1] es;
identifier l;
@@

 i(es,n,...) {
   ...
*  of_node_get(n)
   ...
(
   break;
|
   goto l;
|
   return ...;
)
 }
// </smpl>

---

 arch/mips/pci/pci-rt3883.c |    6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)
