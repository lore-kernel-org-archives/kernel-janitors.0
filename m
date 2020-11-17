From: Nathan Chancellor <natechancellor@gmail.com>
Date: Tue, 17 Nov 2020 16:19:38 +0000
Subject: Re: [PATCH] ring-buffer: remove obsolete rb_event_is_commit()
Message-Id: <20201117161938.GA1271942@ubuntu-m3-large-x86>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20201117053703.11275-1-lukas.bulwahn@gmail.com>
In-Reply-To: <20201117053703.11275-1-lukas.bulwahn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>, Tom Rix <trix@redhat.com>, Nick Desaulniers <ndesaulniers@google.com>, clang-built-linux@googlegroups.com, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 17, 2020 at 06:37:03AM +0100, Lukas Bulwahn wrote:
> Commit a389d86f7fd0 ("ring-buffer: Have nested events still record running
> time stamp") removed the only uses of rb_event_is_commit() in
> rb_update_event() and rb_update_write_stamp().
> 
> Hence, since then, make CC=clang W=1 warns:
> 
>   kernel/trace/ring_buffer.c:2763:1:
>     warning: unused function 'rb_event_is_commit' [-Wunused-function]
> 
> Remove this obsolete function.
> 
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> ---

Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
