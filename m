From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Fri, 23 Jun 2017 07:13:36 +0000
Subject: Re: [PATCH] bnx2i: missing error code in bnx2i_ep_connect()
Message-Id: <20170623071336.GC13014@linux-x5ow.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170623070200.GA7922@elgon.mountain>
In-Reply-To: <20170623070200.GA7922@elgon.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: QLogic-Storage-Upstream@qlogic.com, Michael Chan <mchan@broadcom.com>, "James E.J. Bottomley" <jejb@linux.vnet.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-scsi@vger.kernel.org, kernel-janitors@vger.kernel.org

On Fri, Jun 23, 2017 at 10:02:00AM +0300, Dan Carpenter wrote:
> If bnx2i_map_ep_dbell_regs() then we accidentally return NULL instead
> of an error pointer.  It results in a NULL dereference in
> iscsi_if_ep_connect().
>=20
> Fixes: cf4e6363859d ("[SCSI] bnx2i: Add bnx2i iSCSI driver.")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>=20

Looks good,
Reviewed-by: Johannes Thumshirn <jthumshirn@suse.de>

--=20
Johannes Thumshirn                                          Storage
jthumshirn@suse.de                                +49 911 74053 689
SUSE LINUX GmbH, Maxfeldstr. 5, 90409 N=FCrnberg
GF: Felix Imend=F6rffer, Jane Smithard, Graham Norton
HRB 21284 (AG N=FCrnberg)
Key fingerprint =3D EC38 9CAB C2C4 F25D 8600 D0D0 0393 969D 2D76 0850
--
To unsubscribe from this list: send the line "unsubscribe kernel-janitors" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
