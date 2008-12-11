From: "Task Struct From Hell" <taskstructfromhell@googlemail.com>
Date: Thu, 11 Dec 2008 00:25:24 +0000
Subject: linux rebooting w/o crash dump
Message-Id: <ef37ea20812101625u38af0b42q6a23246bc3eb803@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <ef37ea20812101623g52a36179g7924683d492e7fa7@mail.gmail.com>
In-Reply-To: <ef37ea20812101623g52a36179g7924683d492e7fa7@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

Is there any way to debug a kernel that shuts down without leaving any
sign of crash, shutdown demand or anything else?

I am absolutely sure it's not a power issue, as I am running
multi-boot and it's never shutting down on my other OSes, plus, with a
newer kernel everything works like a charm - even with the flag
'noreboot'. I would seriously love to find the root of this problem,
but I'm feeling slightly hand-tied on it, been seeking for hints and
trying different configurations for about 2 weeks...

Thanks in advance.
