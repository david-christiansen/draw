#lang scribble/doc
@(require "common.rkt")

@defclass/title[gl-config% object% ()]{

A @racket[gl-config%] object encapsulates configuration information
 for an OpenGL drawing context. Use a @racket[gl-config%] object as an
 initialization argument for @racket[canvas%] or provide it to
 @racket[make-gl-bitmap].


@defconstructor[()]{

Creates a GL configuration that indicates legacy OpenGL, double
buffering, a depth buffer of size one, no stencil buffer, no
accumulation buffer, no multisampling, and not stereo.

}

@defmethod[(get-accum-size)
           (integer-in 0 256)]{

Reports the accumulation-buffer size (for each of red, green, blue,
 and alpha) that the configuration requests, where zero means no
 accumulation buffer is requested.

}

@defmethod[(get-depth-size)
           (integer-in 0 256)]{

Reports the depth-buffer size that the configuration requests, where
 zero means no depth buffer is requested.

}

@defmethod[(get-double-buffered)
           boolean?]{

Reports whether the configuration requests double buffering or not.

}

@defmethod[(get-hires-mode)
           boolean?]{

Determines whether to use hires mode. On Mac OS X, hires mode means that the
created OpenGL contexts will have access to the full Retina resolution
and will not be scaled by the drawing system. On other platforms, hires mode
has no effect.

@history[#:added "1.5"]}


@defmethod[(get-legacy?)
           boolean?]{

Determines whether to use legacy ``Compatibility'' OpenGL or ``Core'' OpenGL.
Core OpenGL profiles are currently supported on Mac OS X (version 10.7 and up)
and Linux (if the graphics drivers support them).

@history[#:added "1.2"]}

@defmethod[(get-multisample-size)
           (integer-in 0 256)]{

Reports the multisampling size that the configuration requests, where
 zero means no multisampling is requested.

}

@defmethod[(get-share-context)
           (or/c #f (is-a?/c gl-context<%>))]{

Returns a @racket[gl-context<%>] object that shares certain objects
(textures, display lists, etc.) with newly created OpenGL drawing
contexts, or @racket[#f] is none is set.

See also @method[gl-config% set-share-context].

}
          

@defmethod[(get-stencil-size)
           (integer-in 0 256)]{

Reports the stencil-buffer size that the configuration requests, where
 zero means no stencil buffer is requested.

}

@defmethod[(get-stereo)
           boolean?]{

Reports whether the configuration requests stereo or not.

}

@defmethod[(get-sync-swap)
           boolean?]{

Reports whether the configuration requests buffer-swapping
synchronization with the screen refresh.

@history[#:added "1.10"]}

@defmethod[(set-accum-size [on? (integer-in 0 256)])
           void?]{

Adjusts the configuration to request a particular accumulation-buffer
 size for every channel (red, green, blue, and alpha), where zero
 means no accumulation buffer is requested.

}

@defmethod[(set-depth-size [on? (integer-in 0 256)])
           void?]{

Adjusts the configuration to request a particular depth-buffer size,
 where zero means no depth buffer is requested.

}

@defmethod[(set-double-buffered [on? any/c])
           void?]{

Adjusts the configuration to request double buffering or not.

}

@defmethod[(set-hires-mode [hires-mode any/c])
           void?]{

Adjusts the configuration to request hires mode or not; see
@method[gl-config get-hires-mode].

@history[#:added "1.5"]}

@defmethod[(set-legacy? [legacy? any/c])
           void?]{

Adjusts the configuration to request legacy mode or not; see
@method[gl-config get-legacy?].

@history[#:added "1.2"]}


@defmethod[(set-multisample-size [on? (integer-in 0 256)])
           void?]{

Adjusts the configuration to request a particular multisample size,
 where zero means no multisampling is requested. If a multisampling
 context is not available, this request will be ignored.

}

@defmethod[(set-share-context [context (or/c #f (is-a?/c gl-context<%>))])
           void?]{

Determines a @racket[gl-context<%>] object that shares certain objects
(textures, display lists, etc.) with newly created OpenGL drawing
contexts, where @racket[#f] indicates
that no sharing should occur.

When a context @racket[_B] shares objects with context @racket[_A], it
is also shares objects with every other context sharing with
@racket[_A], and vice versa.

If an OpenGL implementation does not support sharing, @racket[context]
is effectively ignored when a new context is created.
Sharing should be supported in all versions of Mac OS X.
On Windows and Linux, sharing is provided by the presence of the
@tt{WGL_ARB_create_context} and @tt{GLX_ARB_create_context} extensions,
respectively (and OpenGL 3.2 requires both).

}

@defmethod[(set-stencil-size [on? (integer-in 0 256)])
           void?]{

Adjusts the configuration to request a particular stencil-buffer size,
 where zero means no stencil buffer is requested.

}

@defmethod[(set-stereo [on? any/c])
           void?]{

Adjusts the configuration to request stereo or not.}


@defmethod[(set-sync-swap [on? any/c])
           void?]{

Adjusts the configuration to request buffer-swapping
synchronization with the screen refresh or not.

@history[#:added "1.10"]}

}
