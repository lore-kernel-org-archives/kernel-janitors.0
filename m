From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Tue, 05 Jan 2016 12:36:58 +0000
Subject: Re: drm/amd/powerplay: fix a reversed condition
Message-Id: <568BB8EA.7070301@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20160104204255.GB19867@mwanda>
 <568B87B2.5010105@users.sourceforge.net> <20160105111422.GB23363@mwanda>
In-Reply-To: <20160105111422.GB23363@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: David Airlie <airlied@linux.ie>, Jammy Zhou <Jammy.Zhou@amd.com>, Alex Deucher <alexander.deucher@amd.com>, Rex Zhu <Rex.Zhu@amd.com>, dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> Yes.  This was a Smatch warning

Thanks for this acknowledgement.

How do you think about to indicate such a detail more often in
your update suggestions and bug reports?

Would it make sense to mark contributions from automatic static
source code analysis by a dedicated tag in the commit message?


> but Coccinelle can also find this kinds of inconsistent NULL checking.

Should we try together to extend the script collection for the
semantic patch language around such use cases?

Regards,
Markus

