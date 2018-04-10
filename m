From: Sasha Levin <Alexander.Levin@microsoft.com>
Date: Tue, 10 Apr 2018 13:50:40 +0000
Subject: Re: [PATCH] tpm: st33zp24: check if chip is null before dereferencing
Message-Id: <DM5PR2101MB10327A765FB1588EA7700E58FBBE0@DM5PR2101MB1032.namprd21.prod.outlook.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20180406160541.8188-1-colin.king@canonical.com>
In-Reply-To: <20180406160541.8188-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sasha Levin <Alexander.Levin@microsoft.com>, Colin King <colin.king@canonical.com>Colin Ian King <colin.king@canonical.com>, Peter Huewe <peterhuewe@gmx.de>
Cc: "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "stable@vger.kernel.org" <stable@vger.kernel.org>

Hi,

[This is an automated email]

This commit has been processed because it contains a "Fixes:" tag,
fixing commit: 9e0d39d8a6a0 tpm: Remove useless priv field in struct tpm_vendor_specific.

The bot has also determined it's probably a bug fixing patch. (score: 19.6716)

The bot has tested the following trees: v4.16.1, v4.15.16, v4.14.33, v4.9.93.

v4.16.1: Build OK!
v4.15.16: Build OK!
v4.14.33: Build OK!
v4.9.93: Build OK!

--
Thanks,
Sasha