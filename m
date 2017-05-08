From: Bob Peterson <rpeterso@redhat.com>
Date: Mon, 08 May 2017 20:08:37 +0000
Subject: Re: [Cluster-devel] [PATCH 00/10] fs-DLM: Fine-tuning for several function implementations
Message-Id: <1281357904.5439026.1494274117018.JavaMail.zimbra@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
In-Reply-To: <4bd895d7-9448-928d-1e4c-42326ce20607@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: cluster-devel@redhat.com, Christine Caulfield <ccaulfie@redhat.com>, David Teigland <teigland@redhat.com>, kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

----- Original Message -----
| From: Markus Elfring <elfring@users.sourceforge.net>
| Date: Sat, 6 May 2017 10:15:25 +0200
| 
| Some update suggestions were taken into account
| from static source code analysis.
| 
| Markus Elfring (10):
|   Replace six seq_puts() calls by seq_putc()
|   Add spaces for better code readability
|   Improve a size determination in table_seq_start()
|   Use kcalloc() in dlm_scan_waiters()
|   Improve a size determination in dlm_recover_waiters_pre()
|   Delete an error message for a failed memory allocation in
|   dlm_recover_waiters_pre()
|   Use kmalloc_array() in make_member_array()
|   Use kcalloc() in two functions
|   Improve a size determination in two functions
|   Delete an unnecessary variable initialisation in dlm_ls_start()
| 
|  fs/dlm/debug_fs.c | 25 ++++++++++++-------------
|  fs/dlm/lock.c     |  8 +++-----
|  fs/dlm/member.c   | 15 ++++++---------
|  3 files changed, 21 insertions(+), 27 deletions(-)
| 
| --
| 2.12.2
| 
| 
Hi Markus,

I'm not a DLM maintainer, but I've reviewed your patch set and ACK them.
They seem to fit the spirit of:

https://www.kernel.org/doc/html/v4.10/process/coding-style.html#allocating-memory

I've actually got a bunch of similar cleanups myself, but I don't think
there's any overlap.

Regards,

Bob Peterson
Red Hat File Systems
