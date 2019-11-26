From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Tue, 26 Nov 2019 12:22:19 +0000
Subject: [bug report] vsock: add multi-transports support
Message-Id: <20191126122219.v6h2ndawt7hkpz6y@kili.mountain>
List-Id: <kernel-janitors.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: kernel-janitors@vger.kernel.org

Hello Stefano Garzarella,

This is a semi-automatic email about new static checker warnings.

The patch c0cfa2d8a788: "vsock: add multi-transports support" from 
Nov 14, 2019, leads to the following Smatch complaint:

    net/vmw_vsock/af_vsock.c:1014 vsock_poll()
     error: we previously assumed 'transport' could be null (see line 987)

net/vmw_vsock/af_vsock.c
   986			/* If there is something in the queue then we can read. */
   987			if (transport && transport->stream_is_active(vsk) &&
                            ^^^^^^^^^
The patch adds a check for transport.

   988			    !(sk->sk_shutdown & RCV_SHUTDOWN)) {
   989				bool data_ready_now = false;
   990				int ret = transport->notify_poll_in(
   991						vsk, 1, &data_ready_now);
   992				if (ret < 0) {
   993					mask |= EPOLLERR;
   994				} else {
   995					if (data_ready_now)
   996						mask |= EPOLLIN | EPOLLRDNORM;
   997	
   998				}
   999			}
  1000	
  1001			/* Sockets whose connections have been closed, reset, or
  1002			 * terminated should also be considered read, and we check the
  1003			 * shutdown flag for that.
  1004			 */
  1005			if (sk->sk_shutdown & RCV_SHUTDOWN ||
  1006			    vsk->peer_shutdown & SEND_SHUTDOWN) {
  1007				mask |= EPOLLIN | EPOLLRDNORM;
  1008			}
  1009	
  1010			/* Connected sockets that can produce data can be written. */
  1011			if (sk->sk_state = TCP_ESTABLISHED) {
  1012				if (!(sk->sk_shutdown & SEND_SHUTDOWN)) {
  1013					bool space_avail_now = false;
  1014					int ret = transport->notify_poll_out(
                                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^
But it's not checked here.  I guess probably TCP_ESTABLISHED means that
transport is non-NULL?  If so then just ignore the warning.

  1015							vsk, 1, &space_avail_now);
  1016					if (ret < 0) {

regards,
dan carpenter
