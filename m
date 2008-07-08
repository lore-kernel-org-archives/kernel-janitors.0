From: "Mulyadi Santosa" <mulyadi.santosa@gmail.com>
Date: Tue, 08 Jul 2008 08:23:10 +0000
Subject: Re: round_jiffies() question
Message-Id: <f284c33d0807080123t1d8baa0dvcc821e5e1b326160@mail.gmail.com>
List-Id: <kernel-janitors.vger.kernel.org>
References: <6d291e080807062052n16073eb4t53c88f09df430c6e@mail.gmail.com>
In-Reply-To: <6d291e080807062052n16073eb4t53c88f09df430c6e@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi...

On Mon, Jul 7, 2008 at 10:52 AM, Stoyan Gaydarov <stoyboyker@gmail.com> wrote:
> I was just wondering when should round_jiffies() be used instead of
> assigning the timer expiration with a specific jiffies value? Is the
> round_jiffies() function call beneficial everywhere or just some
> places?

In general, you use round_jiffies() if you can tolerate rounded up
value...i.e slightly delayed execution of something (probably a
handler).
