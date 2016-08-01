From: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
Date: Mon, 01 Aug 2016 13:34:09 +0000
Subject: Re: [PATCH] cxl: replace loop with for_each_child_of_node(), remove unneeded of_node_put()
Message-Id: <f4252894-4f35-e296-6a72-e29200d6dcd1@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <601fb58c-7aee-91ce-2a3d-7a29787968fc@au1.ibm.com>
 <1469764534-26948-1-git-send-email-andrew.donnellan@au1.ibm.com>
 <87fuqsllmf.fsf@concordia.ellerman.id.au>
In-Reply-To: <87fuqsllmf.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Michael Ellerman <mpe@ellerman.id.au>, Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: clombard@linux.vnet.ibm.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, julia.lawall@lip6.fr, imunsie@au1.ibm.com, elfring@users.sourceforge.net

Le 29/07/2016 =E0 13:38, Michael Ellerman a =E9crit :
> But who does keep a reference on the device_node? I can't see it anywhere=
. Which
> means in theory the device_node can be freed out from under you.
>
> You have a reference for afu_np as part of for_each_child_of_node(), but =
it's
> dropped as soon as you go around the loop.
>
> The typical pattern would be that cxl_guest_init_afu() takes an additional
> reference once it's done all its setup and can't fail.
>
> That way at the end of the loop when the loop construct has dropped all
> references, the nodes you actually init'ed have their reference count
> incremented by 1.


We don't keep a reference on the AFU device_node. Once we've read the=20
config of the AFU, the AFU device_node is never accessed again. So I=20
guess it's possible (though unexpected) that it's freed from under us,=20
but it should not affect the driver.

The AFU is really dependent on the adapter itself, which is one level up=20
in the device tree, and for which we create a device through=20
of_platform_device_create(). The properties under the AFU device node=20
are read directly from the PCI config space in the bare-metal case,=20
where the cxl adapter is a PCI device.

Do we really have a problem here?

   Fred

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
