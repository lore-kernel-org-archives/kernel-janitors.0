From: Joe Perches <joe@perches.com>
Date: Mon, 24 Feb 2020 05:25:37 +0000
Subject: Re: [PATCH] staging: rtl8723bs: remove temporary variable CrystalCap
Message-Id: <5fb70429b277a714be52f2ca3d15fc4e42b870d9.camel@perches.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20200223151438.415542-1-colin.king@canonical.com>
In-Reply-To: <20200223151438.415542-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Sun, 2020-02-23 at 15:14 +0000, Colin King wrote:
> odm_GetDefaultCrytaltalCap

Might change the likely function name typo too

from
	odm_GetDefaultCrytaltalCap
to
	odm_GetDefaultCrystalCap
