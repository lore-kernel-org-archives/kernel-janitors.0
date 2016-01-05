From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 05 Jan 2016 11:14:22 +0000
Subject: Re: [patch] drm/amd/powerplay: fix a reversed condition
Message-Id: <20160105111422.GB23363@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160104204255.GB19867@mwanda>
 <568B87B2.5010105@users.sourceforge.net>
In-Reply-To: <568B87B2.5010105@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Jammy Zhou <Jammy.Zhou@amd.com>, kernel-janitors@vger.kernel.org, dri-devel@lists.freedesktop.org, Julia Lawall <julia.lawall@lip6.fr>, Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>

Yes.  This was a Smatch warning but Coccinelle can also find this kinds
of inconsistent NULL checking.

regards,
dan carpenter

