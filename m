From: "Thomas Surrel" <thomas.surrel@gmail.com>
Date: Thu, 19 Jul 2007 08:57:00 +0000
Subject: Re: netdev_priv()
Message-Id: <d858bca40707190157n17772968iba036daa271789af@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
In-Reply-To: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

On 7/19/07, Yoann Padioleau <padator@wanadoo.fr> wrote:
> "Thomas Surrel" <thomas.surrel@gmail.com> writes:
>
> > Hi,
> >
> > I'm starting to work on the change to netdev_priv() call to access the
> > priv field of the net_device structure. Is anybody already working on
> > this ?
>
> Yes, I am working a little on it. I already have written
> a semantic patch that does the transformation:
>
> @@
> struct net_device *dev;
> type T;
> @@
>
> - (T) dev->priv
> + netdev_priv(dev)
>
>
> The end of this mail contains an excerpt of the patch generated
> by my automatic program transformation tool given the semantic patch
> for drivers/net/arcnet/
>
> >
> > Also, what is the best way to organize my patches: one per subsystem
> > (wireless, token ring, ...) or even more detailed which would imply a
> > lot more patches ?
>
> From what I understand Morton prefers patch per subsystem.
> Maybe I can submit the patch generated automatically by my tool
> and later you can try to find the remaining case that my tool
> does not handle ?
>

Sounds good. But from what I saw, you have to be really careful with
what your semantic patch would do. Correct me if I am wrong, but the
point of using netdev_priv is to access a private structure that is
right next to the net_device structure in memory. Unfortunately, some
drivers are allocating their private structure in other memory area,
e.g. net/wireless/libertas/main.c:

int libertas_add_mesh(wlan_private *priv, struct device *dev)
{
	struct net_device *mesh_dev = NULL;
	int ret = 0;

	lbs_deb_enter(LBS_DEB_MESH);

	/* Allocate a virtual mesh device */
	if (!(mesh_dev = alloc_netdev(0, "msh%d", ether_setup))) {
		lbs_deb_mesh("init mshX device failed\n");
		ret = -ENOMEM;
		goto done;
	}
	mesh_dev->priv = priv;
	priv->mesh_dev = mesh_dev;
	[...]

In that case, using netdev_priv() would break things. I guess we
should not try to change anything to these drivers.

Regards,

Thomas
