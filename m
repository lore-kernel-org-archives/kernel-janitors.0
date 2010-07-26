From: David Howells <dhowells@redhat.com>
Date: Mon, 26 Jul 2010 11:32:56 +0000
Subject: Re: [PATCH] afs: do not set task state after schedule_timeout()
Message-Id: <5712.1280143976@redhat.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <1280132829-8224-1-git-send-email-segooon@gmail.com>
In-Reply-To: <1280132829-8224-1-git-send-email-segooon@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kulikov Vasiliy <segooon@gmail.com>
Cc: dhowells@redhat.com, kernel-janitors@vger.kernel.org, Tejun Heo <tj@kernel.org>, linux-afs@lists.infradead.org, linux-kernel@vger.kernel.org

Kulikov Vasiliy <segooon@gmail.com> wrote:

> schedule_timeout() sets tast state to TASK_RUNNING, so there's no need
> to set it explicitly.
> 
> Signed-off-by: Kulikov Vasiliy <segooon@gmail.com>

Acked-by: David Howells <dhowells@redhat.com>
