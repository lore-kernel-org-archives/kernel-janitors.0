From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Mon, 28 Sep 2020 11:53:01 +0000
Subject: Re: [PATCH] leds: lp50xx: Fix an error handling path in 'lp50xx_probe_dt()'
Message-Id: <20200928115301.GB3987353@kuha.fi.intel.com>
MIME-Version: 1
Content-Type: multipart/mixed; boundary="RnlQjJ0d97Da+TV1"
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200922210515.385099-1-christophe.jaillet@wanadoo.fr>
 <20200923133510.GJ4282@kadam>
 <faa49efc-5ba5-b6bd-b486-2f7c4611219b@wanadoo.fr>
 <20200924064932.GP18329@kadam>
In-Reply-To: <20200924064932.GP18329@kadam>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, pavel@ucw.cz, dmurphy@ti.com, jacek.anaszewski@gmail.com, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 24, 2020 at 09:49:32AM +0300, Dan Carpenter wrote:
> On Wed, Sep 23, 2020 at 08:49:56PM +0200, Christophe JAILLET wrote:
> > Le 23/09/2020 =E0 15:35, Dan Carpenter a =E9crit=A0:
> > > I've added Heikki Krogerus to the CC list because my question is most=
ly
> > > about commit 59abd83672f7 ("drivers: base: Introducing software nodes=
 to
> > > the firmware node framework").
> > >=20
> > > I have been trying to teach Smatch to understand reference counting so
> > > it can discover these kinds of bugs automatically.
> > >=20
> > > I don't know how software_node_get_next_child() can work when it does=
n't
> > > call kobject_get().  This sort of bug would have been caught in testi=
ng
> > > because it affects the success path so I must be reading the code wro=
ng.
> > >=20
> >=20
> > I had the same reading of the code and thought that I was missing somet=
hing
> > somewhere.
> >=20
> > There is the same question about 'acpi_get_next_subnode' which is also a
> > '.get_next_child_node' function, without any ref counting, if I'm corre=
ct.
> >=20
>=20
> Yeah, but there aren't any ->get/put() ops for the acpi_get_next_subnode()
> stuff so it's not a problem.  (Presumably there is some other sort of
> refcounting policy there).

OK, so I guess we need to make software_node_get_next_child()
mimic the behaviour of of_get_next_available_child(), and not
acpi_get_next_subnode(). Does the attached patch work?


thanks,

--=20
heikki

--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-software-nodes-Handle-the-refcounting-also-in-softwa.patch"

From 9b5744450d07b1e6e32e441785b9b69d7e54a7b1 Mon Sep 17 00:00:00 2001
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Date: Mon, 28 Sep 2020 14:38:09 +0300
Subject: [PATCH] software nodes: Handle the refcounting also in
 software_node_get_next_child()

Incrementing the reference count of the node that is
returned in software_node_get_next_child(), and decrementing
the reference count of the previous node.

Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/base/swnode.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 010828fc785bc..adbaafab3887b 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -439,18 +439,26 @@ static struct fwnode_handle *
 software_node_get_next_child(const struct fwnode_handle *fwnode,
 			     struct fwnode_handle *child)
 {
-	struct swnode *p = to_swnode(fwnode);
-	struct swnode *c = to_swnode(child);
+	struct swnode *parent = to_swnode(fwnode);
+	struct swnode *prev = to_swnode(child);
+	struct swnode *next;
 
-	if (!p || list_empty(&p->children) ||
-	    (c && list_is_last(&c->entry, &p->children)))
+	if (!parent || list_empty(&parent->children))
 		return NULL;
 
-	if (c)
-		c = list_next_entry(c, entry);
-	else
-		c = list_first_entry(&p->children, struct swnode, entry);
-	return &c->fwnode;
+	if (prev && list_is_last(&prev->entry, &parent->children)) {
+		kobject_put(&prev->kobj);
+		return NULL;
+	}
+
+	if (prev) {
+		next = list_next_entry(prev, entry);
+		kobject_put(&prev->kobj);
+	} else {
+		next = list_first_entry(&parent->children, struct swnode, entry);
+	}
+
+	return fwnode_handle_get(&next->fwnode);
 }
 
 static struct fwnode_handle *
-- 
2.28.0


--RnlQjJ0d97Da+TV1--
