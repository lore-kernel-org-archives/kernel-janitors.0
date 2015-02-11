From: SF Markus Elfring <elfring@users.sourceforge.net>
Date: Wed, 11 Feb 2015 12:10:34 +0000
Subject: Re: [PATCH] fs: dlm: lockspace.c: removal of unnecessary check before calling kfree()
Message-Id: <54DB46BA.7020803@users.sourceforge.net>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1423646814-22720-1-git-send-email-baspeters93@gmail.com>
In-Reply-To: <1423646814-22720-1-git-send-email-baspeters93@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bas Peters <baspeters93@gmail.com>, Christine Caulfield <ccaulfie@redhat.com>, David Teigland <teigland@redhat.com>
Cc: cluster-devel@redhat.com, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> kfree() checks its argument. It is therefore unnecessary to do this twice.
> 
> This issue was detected using Coccinelle.

Would you like to integrate my update suggestion 'fs-DLM: Deletion of
unnecessary checks before the function call "kfree"'?
https://lkml.org/lkml/2014/11/29/88
http://article.gmane.org/gmane.linux.kernel/1840524
https://www.mail-archive.com/linux-kernel@vger.kernel.org/msg778279.html

Regards,
Markus

