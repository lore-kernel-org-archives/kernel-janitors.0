From: Johannes Thumshirn <jthumshirn@suse.de>
Date: Tue, 08 Aug 2017 10:20:26 +0000
Subject: Re: [PATCH] IB/core: fix memory leak on ah on error return path
Message-Id: <20170808102026.GG3926@linux-x5ow.site>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20170808101054.13800-1-colin.king@canonical.com>
In-Reply-To: <20170808101054.13800-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: Colin King <colin.king@canonical.com>
Cc: Lijun Ou <oulijun@huawei.com>, Wei Hu <xavier.huwei@huawei.com>, Doug Ledford <dledford@redhat.com>, Sean Hefty <sean.hefty@intel.com>, Hal Rosenstock <hal.rosenstock@gmail.com>, linux-rdma@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

Shouldn't the subject start with "IB/hns:" given it's touching
drivers/infiniband/hw/hns/hns_roce_ah.c?

Byte,
	Johannes

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
