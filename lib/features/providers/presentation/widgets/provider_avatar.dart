import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:medifinder_demo/core/constants/app_colors.dart';
import 'package:medifinder_demo/core/extensions/string_ext.dart';
import 'package:medifinder_demo/features/providers/domain/entities/provider_entity.dart';

class ProviderAvatar extends StatelessWidget {
  const ProviderAvatar({
    super.key,
    required this.provider,
    required this.size,
    this.heroTag,
  });

  final ProviderEntity provider;
  final double size;
  final String? heroTag;

  @override
  Widget build(BuildContext context) {
    final avatar = _buildAvatar(context);

    if (heroTag != null) {
      return Hero(tag: heroTag!, child: avatar);
    }

    return avatar;
  }

  Widget _buildAvatar(BuildContext context) {
    if (provider.imageUrl.isNullOrEmpty) {
      return _InitialsAvatar(
        name: provider.name,
        size: size,
        providerId: provider.id,
      );
    }

    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: provider.imageUrl!,
        width: size,
        height: size,
        fit: BoxFit.cover,
        placeholder:
            (context, url) => _InitialsAvatar(
              name: provider.name,
              size: size,
              providerId: provider.id,
            ),
        errorWidget:
            (context, url, error) => _InitialsAvatar(
              name: provider.name,
              size: size,
              providerId: provider.id,
            ),
      ),
    );
  }
}

class _InitialsAvatar extends StatelessWidget {
  const _InitialsAvatar({
    required this.name,
    required this.size,
    required this.providerId,
  });

  final String name;
  final double size;
  final String providerId;

  Color _avatarColor() {
    final colors = [
      AppColors.primary,
      const Color(0xFF0E9F6E),
      const Color(0xFFFF5A1F),
      const Color(0xFF9061F9),
      const Color(0xFF1C64F2),
      const Color(0xFF0694A2),
    ];
    final index = providerId.hashCode.abs() % colors.length;
    return colors[index];
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: _avatarColor().withValues(alpha: 0.15),
          shape: BoxShape.circle,
          border: Border.all(
            color: _avatarColor().withValues(alpha: 0.25),
          ),
        ),
        child: Center(
          child: Text(
            name.initials,
            style: TextStyle(
              color: _avatarColor(),
              fontSize: size * 0.32,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
