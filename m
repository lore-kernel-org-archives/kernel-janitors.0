From: Yoann Padioleau <padator@wanadoo.fr>
Date: Thu, 19 Jul 2007 13:59:29 +0000
Subject: Re: netdev_priv()
Message-Id: <87zm1s5wam.fsf@wanadoo.fr>
List-Id: <kernel-janitors.vger.kernel.org>
References: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
In-Reply-To: <d858bca40707181524r30f501dcnd1ecf1b4e9d2af86@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

"Alexey Dobriyan" <adobriyan@gmail.com> writes:

> This reminds me OOP wankers adding private members to class and
> two accessors per member of get_foo, set_foo variety instead of
> simple assignments.
>
> General direction is that struct net_device::priv will be made integer,

Why an integer ? 

> If yes, 

"If yes" what ? What is the question ? 

> patch is OK, if not -- quite reverse patch should be done.

I don't understand. By reverse patch you mean "don't do anything" ? 

>
> On 7/19/07, Yoann Padioleau <padator@wanadoo.fr> wrote:
>> "Thomas Surrel" <thomas.surrel@gmail.com> writes:
>>
>> >> @@
>> >> struct net_device *dev;
>> >> type T;
>> >> @@
>> >>
>> >> - (T) dev->priv
>> >> + netdev_priv(dev)
>> >>
>> >>
>> >
>> > Sounds good. But from what I saw, you have to be really careful with
>> > what your semantic patch would do. Correct me if I am wrong, but the
>> > point of using netdev_priv is to access a private structure that is
>> > right next to the net_device structure in memory.
>>
>> Yes, you are right according to
>> http://groups.google.com/group/comp.os.linux.development.system/browse_thread/thread/de19321bcd94dbb8/0d74a4adcd6177bd
>>
>> Thanks for pointing out a problem. I have refined my semantic patch:
>>
>> @ rule1 @
>> type T;
>> struct net_device *dev;
>> @@
>>
>>  dev = alloc_netdev(sizeof(T), ...)
>>
>>
>> @ rule1bis @
>> struct net_device *dev;
>> expression E;
>> @@
>>  dev->priv = E
>>
>>
>> @ rule2 depends on rule1 && !rule1bis  @
>> struct net_device *dev;
>> type rule1.T;
>> @@
>>
>> - (T*) dev->priv
>> + netdev_priv(dev)
>>
>>
>> @ rule3 depends on rule1 && !rule1bis @
>> struct net_device *dev;
>> @@
>>
>> - dev->priv
>> + netdev_priv(dev)
>>
>>
>>
>> I have put the generated patch in the end of this mail for all drivers
>> under drivers/net/. Because of the new condition on alloc_netdev, the patch
>> does not touch anymore net/wireless/libertas/main.c.
>>
>> > Unfortunately, some
>> > drivers are allocating their private structure in other memory area,
>> > e.g. net/wireless/libertas/main.c:
>> >
>> > int libertas_add_mesh(wlan_private *priv, struct device *dev)
>> > {
>> > 	struct net_device *mesh_dev = NULL;
>> > 	int ret = 0;
>> >
>> > 	lbs_deb_enter(LBS_DEB_MESH);
>> >
>> > 	/* Allocate a virtual mesh device */
>> > 	if (!(mesh_dev = alloc_netdev(0, "msh%d", ether_setup))) {
>> > 		lbs_deb_mesh("init mshX device failed\n");
>> > 		ret = -ENOMEM;
>> > 		goto done;
>> > 	}
>> > 	mesh_dev->priv = priv;
>> > 	priv->mesh_dev = mesh_dev;
>> > 	[...]
>> >
>> > In that case, using netdev_priv() would break things. I guess we
>> > should not try to change anything to these drivers.
>>
>> That's what my new semantic patch does. But maybe I am now too
>> restrictive. Do you know other conditions where we can safely
>> do the transformation ?
>>
>> >
>> > Regards,
>> >
>> > Thomas

[...]

