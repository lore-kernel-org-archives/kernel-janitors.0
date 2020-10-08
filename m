From: Steven Rostedt <rostedt@goodmis.org>
Date: Thu, 08 Oct 2020 20:48:07 +0000
Subject: Re: [PATCH][V2] selftests/ftrace: check for do_sys_openat2 in user-memory test
Message-Id: <20201008164807.62582e8c@gandalf.local.home>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201002132501.88992-1-colin.king@canonical.com>
In-Reply-To: <20201002132501.88992-1-colin.king@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Colin King <colin.king@canonical.com>, Shuah Khan <shuah@kernel.org>
Cc: Ingo Molnar <mingo@redhat.com>, Tom Zanussi <zanussi@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, linux-kselftest@vger.kernel.org, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>

On Fri,  2 Oct 2020 14:25:01 +0100
Colin King <colin.king@canonical.com> wrote:

> From: Colin Ian King <colin.king@canonical.com>
> 
> More recent libc implementations are now using openat/openat2 system
> calls so also add do_sys_openat2 to the tracing so that the test
> passes on these systems because do_sys_open may not be called.
> 
> Thanks to Masami Hiramatsu for the help on getting this fix to work
> correctly.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>

Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

Shuah,

Care to take this through your tree?

-- Steve
