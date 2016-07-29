From: Frederic Barrat <fbarrat@linux.vnet.ibm.com>
Date: Fri, 29 Jul 2016 07:43:22 +0000
Subject: Re: [PATCH] cxl: replace loop with for_each_child_of_node(), remove unneeded of_node_put()
Message-Id: <ccadf7cc-6b10-1559-9c7a-23e28d4a4d51@linux.vnet.ibm.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <601fb58c-7aee-91ce-2a3d-7a29787968fc@au1.ibm.com>
 <1469764534-26948-1-git-send-email-andrew.donnellan@au1.ibm.com>
In-Reply-To: <1469764534-26948-1-git-send-email-andrew.donnellan@au1.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Andrew Donnellan <andrew.donnellan@au1.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: imunsie@au1.ibm.com, clombard@linux.vnet.ibm.com, kernel-janitors@vger.kernel.org, elfring@users.sourceforge.net, julia.lawall@lip6.fr, linux-kernel@vger.kernel.org


Le 29/07/2016 =E0 05:55, Andrew Donnellan a =E9crit :
> Rewrite the cxl_guest_init_afu() loop in cxl_of_probe() to use
> for_each_child_of_node() rather than a hand-coded for loop.
>
> Remove the useless of_node_put(afu_np) call after the loop, where it's
> guaranteed that afu_np =3D NULL.
>
> Reported-by: SF Markus Elfring <elfring@users.sourceforge.net>
> Reported-by: Julia Lawall <julia.lawall@lip6.fr>
> Signed-off-by: Andrew Donnellan <andrew.donnellan@au1.ibm.com>


Thanks!

Reviewed-by: Frederic Barrat <fbarrat@linux.vnet.ibm.com>

--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
