From: Steven Rostedt <rostedt@goodmis.org>
Date: Thu, 01 Oct 2020 15:56:58 +0000
Subject: Re: [PATCH] selftests/ftrace: check for do_sys_openat2 in user-memory test
Message-Id: <20201001115658.164e28b9@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201001085641.51130-1-colin.king@canonical.com>
        <20201001104448.427a0eaa@gandalf.local.home>
        <80cee321-d8ed-31fd-2f53-d9306b1d9545@canonical.com>
In-Reply-To: <80cee321-d8ed-31fd-2f53-d9306b1d9545@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin Ian King <colin.king@canonical.com>
Cc: Ingo Molnar <mingo@redhat.com>, Shuah Khan <shuah@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Tom Zanussi <zanussi@kernel.org>, linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 1 Oct 2020 16:40:33 +0100
Colin Ian King <colin.king@canonical.com> wrote:

> So this test breaks with a recent libc and support tools built against
> libc.  I believe the do_sys_open is not being detected because
> do_sys_openat2 is being called instead.
> 
> Not sure now of the correct way to fix this.

Perhaps by enabling both events?

-- Steve
