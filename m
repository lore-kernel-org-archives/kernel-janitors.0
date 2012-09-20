From: Stephen Warren <swarren@nvidia.com>
Date: Thu, 20 Sep 2012 15:48:53 +0000
Subject: RE: [mfd:for-next 47/76] drivers/mfd/max8907.c:179:16: sparse: symbol 'max8907_pm_off' was not decla
Message-Id: <74CDBE0F657A3D45AFBB94109FB122FF17EF5465BB@HQMAIL01.nvidia.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20120919233348.GD5607@localhost>
In-Reply-To: <20120919233348.GD5607@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Fengguang Wu wrote at Wednesday, September 19, 2012 5:34 PM:
> Hi Stephen,
> 
> FYI, there are new sparse warnings show up in
> 
> tree:   git://git.kernel.org/pub/scm/linux/kernel/git/sameo/mfd-2.6.git for-next
> head:   144c94c99ad2f20ff37ca77147a10da7718895ad
> commit: 9582fdcb6fcf1b596a83b161a2ea886272d2a62f [47/76] mfd: max8907: Add power off control
> 
> All sparse warnings:
> 
> + drivers/mfd/max8907.c:179:16: sparse: symbol 'max8907_pm_off' was not declared. Should it be static?
...
> Please consider folding the attached diff :-)

Yes, the diff is correct; please consider it:

Acked-by: Stephen Warren <swarren@nvidia.com>

-- 
nvpublic

