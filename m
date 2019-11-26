From: Stefano Garzarella <sgarzare@redhat.com>
Date: Tue, 26 Nov 2019 13:05:04 +0000
Subject: Re: [bug report] vsock: add multi-transports support
Message-Id: <20191126130504.wpzu5mrmgwzamghh@steredhat>
List-Id: <kernel-janitors.vger.kernel.org>
References: <20191126122219.v6h2ndawt7hkpz6y@kili.mountain>
In-Reply-To: <20191126122219.v6h2ndawt7hkpz6y@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hi Dan,

On Tue, Nov 26, 2019 at 03:22:19PM +0300, Dan Carpenter wrote:
> Hello Stefano Garzarella,
> 
> This is a semi-automatic email about new static checker warnings.
> 
> The patch c0cfa2d8a788: "vsock: add multi-transports support" from 
> Nov 14, 2019, leads to the following Smatch complaint:
> 
>     net/vmw_vsock/af_vsock.c:1014 vsock_poll()
>      error: we previously assumed 'transport' could be null (see line 987)
> 
> net/vmw_vsock/af_vsock.c
>    986			/* If there is something in the queue then we can read. */
>    987			if (transport && transport->stream_is_active(vsk) &&
>                             ^^^^^^^^^
> The patch adds a check for transport.
> 
>    988			    !(sk->sk_shutdown & RCV_SHUTDOWN)) {
>    989				bool data_ready_now = false;
>    990				int ret = transport->notify_poll_in(
>    991						vsk, 1, &data_ready_now);
>    992				if (ret < 0) {
>    993					mask |= EPOLLERR;
>    994				} else {
>    995					if (data_ready_now)
>    996						mask |= EPOLLIN | EPOLLRDNORM;
>    997	
>    998				}
>    999			}
>   1000	
>   1001			/* Sockets whose connections have been closed, reset, or
>   1002			 * terminated should also be considered read, and we check the
>   1003			 * shutdown flag for that.
>   1004			 */
>   1005			if (sk->sk_shutdown & RCV_SHUTDOWN ||
>   1006			    vsk->peer_shutdown & SEND_SHUTDOWN) {
>   1007				mask |= EPOLLIN | EPOLLRDNORM;
>   1008			}
>   1009	
>   1010			/* Connected sockets that can produce data can be written. */
>   1011			if (sk->sk_state == TCP_ESTABLISHED) {
>   1012				if (!(sk->sk_shutdown & SEND_SHUTDOWN)) {
>   1013					bool space_avail_now = false;
>   1014					int ret = transport->notify_poll_out(
>                                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^
> But it's not checked here.  I guess probably TCP_ESTABLISHED means that
> transport is non-NULL?  If so then just ignore the warning.

Exactly, TCP_ESTABLISHED is set (by the transport) only when a socket is
assigned to a transport, so transport cannot be null here.

Thanks for warning me,
Stefano
