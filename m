From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 23 Jan 2017 09:30:26 +0000
Subject: Re: [PATCH 8/9] KVM: Adjust seven checks for null pointers
Message-Id: <20170123093026.GM4454@mwanda>
List-Id: <kernel-janitors.vger.kernel.org>
References: <a2fb541a-7a7d-1f78-b587-1191b9832088@users.sourceforge.net>
 <d6a66841-b6f4-f888-51e8-f1ad124874ab@users.sourceforge.net>
In-Reply-To: <d6a66841-b6f4-f888-51e8-f1ad124874ab@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Radim =?utf-8?B?S3LEjW3DocWZ?= <rkrcmar@redhat.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

Hm...  GCC complains about "if (array)" but not about
"if (array != NULL) ".  I view this as a bug in GCC...

But you should still be seeing these compile warnings.  This is
something like the 6th warning that kbuild has had to send you.

regards,
dan carpenter

