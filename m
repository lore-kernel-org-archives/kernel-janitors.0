From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon, 04 Jan 2021 14:17:56 +0000
Subject: Re: [PATCH 1/2] regmap: debugfs: Delete a misplaced pointer check in regmap_debugfs_init()
Message-Id: <X/MjlO6jwJWFfQmU@kroah.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201229105046.41984-1-xiaolei.wang@windriver.com>
 <d516efdd-7e66-13fe-3798-cdea5ff012dc@web.de>
 <PH0PR11MB5077EC74C0A81ABF8F082BC795D70@PH0PR11MB5077.namprd11.prod.outlook.com>
 <d463ff8b-306d-6f40-9115-1595d69edc95@web.de>
 <PH0PR11MB507731B129639CED3B8C753595D70@PH0PR11MB5077.namprd11.prod.outlook.com>
 <932c5921-9ad3-e37b-5f31-4de69fa0ca8b@web.de>
 <81f33869-32f6-650f-0f06-e2a5dce57236@web.de>
In-Reply-To: <81f33869-32f6-650f-0f06-e2a5dce57236@web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Markus Elfring <Markus.Elfring@web.de>
Cc: Xiaolei Wang <xiaolei.wang@windriver.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Mark Brown <broonie@kernel.org>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>, David Lechner <david@lechnology.com>, Julia Lawall <julia.lawall@lip6.fr>, Zheng Yongjun <zhengyongjun3@huawei.com>

On Mon, Jan 04, 2021 at 03:12:33PM +0100, Markus Elfring wrote:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Mon, 4 Jan 2021 13:43:01 +0100

This does not belong in a changelog body of a patch :(
