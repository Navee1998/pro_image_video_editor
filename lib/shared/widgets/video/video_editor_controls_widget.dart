import 'package:flutter/material.dart';

import '/core/models/editor_configs/video/video_editor_configs.dart';
import '/core/models/video/trim_duration_span_model.dart';
import '/shared/widgets/video/toolbar/video_editor_trim_info_widget.dart';
import '/shared/widgets/video/video_editor_state_widget.dart';
import 'toolbar/video_editor_info_banner.dart';
import 'toolbar/video_editor_mute_button.dart';
import 'toolbar/video_editor_play_button.dart';
import 'trimmer/video_editor_trim_bar.dart';
import 'video_editor_configurable.dart';

/// A widget that manages the video editor's control elements.
///
/// This includes the trim bar, mute button, info banner, and state indicator.
class VideoEditorControlsWidget extends StatelessWidget {
  /// Creates a [VideoEditorControlsWidget] widget.
  const VideoEditorControlsWidget({super.key, this.initialTrimSpan});

  /// The initial trim range applied when the editor is opened.
  final TrimDurationSpan? initialTrimSpan;

  @override
  Widget build(BuildContext context) {
    final player = VideoEditorConfigurable.of(context);

    bool isAudioSupported = player.configs.isAudioSupported;
    bool enablePlayButton = player.configs.enablePlayButton;
    bool enableTrimBar = player.configs.enableTrimBar;
    final toolbarPadding = player.style.toolbarPadding;

    return Stack(
      children: [
        player.widgets.headerToolbar ??
            Column(
              spacing: 10,
              verticalDirection: VerticalDirection.up,
              children: [
                Padding(
                  padding: toolbarPadding.copyWith(),
                  child: LayoutBuilder(builder: (_, constraints) {
                    return Row(
                      spacing: constraints.maxWidth < 340 ? 6 : 12,
                      children: [
                        if (enablePlayButton) const VideoEditorPlayButton(),
                        if (isAudioSupported) const VideoEditorMuteButton(),
                        const Spacer(),
                        if (constraints.maxWidth >= 300)
                          const VideoEditorTrimInfoWidget(),
                        const VideoEditorInfoBanner(),
                      ],
                    );
                  }),
                ),
              ],
            ),
        if (!enablePlayButton) const VideoEditorStateWidget(),
      ],
    );
  }
}
